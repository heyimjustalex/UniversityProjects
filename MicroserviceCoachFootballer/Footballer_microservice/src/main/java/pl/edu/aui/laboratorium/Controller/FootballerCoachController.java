package pl.edu.aui.laboratorium.Controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;
import pl.edu.aui.laboratorium.DTO.CreateFootballerRequest;
import pl.edu.aui.laboratorium.DTO.GetFootballerResponse;
import pl.edu.aui.laboratorium.DTO.GetFootballersResponse;
import pl.edu.aui.laboratorium.DTO.UpdateFootballerRequest;
import pl.edu.aui.laboratorium.Entity.Coach;
import pl.edu.aui.laboratorium.Entity.Footballer;
import pl.edu.aui.laboratorium.Service.CoachService;
import pl.edu.aui.laboratorium.Service.FootballerService;


import java.util.Optional;

@RestController
@RequestMapping("api/coaches/{id}/footballers")
public class FootballerCoachController {

    private FootballerService footballerService;
    private CoachService coachService;

    @Autowired
    public FootballerCoachController(FootballerService footballerService, CoachService coachService) {
        this.footballerService = footballerService;
        this.coachService = coachService;
    }

    @GetMapping
    public ResponseEntity<GetFootballersResponse> getFootballers(@PathVariable("id") Integer id) {
        Optional<Coach> coach = coachService.findById(id);
        return coach.map(value -> ResponseEntity.ok(GetFootballersResponse.entityToDtoMapper().apply(footballerService.findAllByCoach(value))))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping("{_id}")
    public ResponseEntity<GetFootballerResponse> getFootballer(@PathVariable("id") Integer coachId,
                                                   @PathVariable("_id") Integer footballerId) {
        return footballerService.findByCoachIdFootballerId(coachId, footballerId)
                .map(value -> ResponseEntity.ok(GetFootballerResponse.entityToDtoMapper().apply(value)))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<Void> createFootballer(@PathVariable("id") Integer id,
                                           @RequestBody CreateFootballerRequest request,
                                           UriComponentsBuilder builder) {
        Optional<Coach> coach = coachService.findById(id);
        if (coach.isPresent()) {
            Footballer footballer = CreateFootballerRequest
                    .dtoToEntityMapper(idd -> coachService.findById(idd).orElseThrow())
                    .apply(request);
            footballer = footballerService.save(footballer);
            return ResponseEntity.created(builder.pathSegment("api", "coaches", "{id}", "footballers", "{name}")
                    .buildAndExpand(coach.get().getName(), footballer.getName()).toUri()).build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("{_id}")
    public ResponseEntity<Void> deleteFootballer(@PathVariable("id") Integer id,
                                           @PathVariable("_id") Integer _id) {
        Optional<Footballer> footballer = footballerService.findByCoachIdFootballerId(id,_id);
        if (footballer.isPresent()) {
            footballerService.delete(footballer.get());
            return ResponseEntity.accepted().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PutMapping("{_id}")
    public ResponseEntity<Void> updateFootballer(@PathVariable("id") Integer id,
                                                 @RequestBody UpdateFootballerRequest request,
                                                 @PathVariable("_id") Integer _id) {
        Optional<Footballer> footballer = footballerService.findByCoachIdFootballerId(id, _id);
        if (footballer.isPresent()) {
            UpdateFootballerRequest.dtoToEntityUpdater().apply(footballer.get(), request);
            footballerService.update(footballer.get());
            return ResponseEntity.accepted().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}