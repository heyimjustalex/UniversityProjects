package pl.edu.aui.laboratorium.Controller;
import pl.edu.aui.laboratorium.DTO.CreateCoachRequest;
import pl.edu.aui.laboratorium.DTO.GetCoachResponse;
import pl.edu.aui.laboratorium.DTO.GetCoachesResponse;
import pl.edu.aui.laboratorium.DTO.UpdateCoachRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;
import pl.edu.aui.laboratorium.Entity.Coach;
import pl.edu.aui.laboratorium.Service.CoachService;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;


@RestController
@RequestMapping("api/coaches")

public class CoachController
{
    CoachService coachService;


    @Autowired
    public CoachController(CoachService coachService)
    {
        this.coachService = coachService;

    }

    @GetMapping
    public ResponseEntity<GetCoachesResponse> getCoaches() {
        List<Coach> all = coachService.findAll();
        Function<Collection<Coach>,GetCoachesResponse> mapper = GetCoachesResponse.entityToDtoMapper();
        GetCoachesResponse response = mapper.apply(all);
        return  ResponseEntity.ok(response);
    }

    @GetMapping("{id}")
    public ResponseEntity<GetCoachResponse> getCoach(@PathVariable("id") int id) {
        return coachService.find(id)
                .map(value -> ResponseEntity.ok(GetCoachResponse.entityToDtoMapper().apply(value)))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<Void> createCoach(@RequestBody CreateCoachRequest request, UriComponentsBuilder builder) {
        Coach coach = CreateCoachRequest
                .dtoToEntityMapper()
                .apply(request);

        coach = coachService.save(coach,false);
        return ResponseEntity.created(builder.pathSegment("api","coaches","{id}")
                .buildAndExpand(coach.getId()).toUri())
                .build();
    }

    @PutMapping("{id}")
    public ResponseEntity<Void> updateCoach(@RequestBody UpdateCoachRequest request, @PathVariable("id") int id) {
        Optional<Coach> coach = coachService.find(id);
        if (coach.isPresent()) {
            UpdateCoachRequest.dtoToEntityUpdater().apply(coach.get(), request);
            coachService.update(coach.get());
            return ResponseEntity.accepted().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("{id}")
    public ResponseEntity<Void> deleteCoach(@PathVariable("id") int id) {
        Optional<Coach> coach = coachService.find(id);
        if(!coach.isPresent()) {
            return ResponseEntity.notFound().build();
        }
        coachService.delete(coach.get());
        return ResponseEntity.ok().build();
    }
}
