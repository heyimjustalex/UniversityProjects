package pl.edu.aui.laboratorium.Controller;
import pl.edu.aui.laboratorium.DTO.CreateFootballerRequest;
import pl.edu.aui.laboratorium.DTO.GetFootballerResponse;
import pl.edu.aui.laboratorium.DTO.GetFootballersResponse;
import pl.edu.aui.laboratorium.DTO.UpdateFootballerRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;
import pl.edu.aui.laboratorium.Entity.Footballer;
import pl.edu.aui.laboratorium.Service.CoachService;
import pl.edu.aui.laboratorium.Service.FootballerService;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@RestController
@RequestMapping("api/footballers")

public class FootballerController {

    CoachService coachService;
    FootballerService footballerService;

    @Autowired
    public FootballerController(CoachService coachService, FootballerService footballerService) {
        this.coachService = coachService;
        this.footballerService = footballerService;
    }

    @GetMapping
    public ResponseEntity<GetFootballersResponse> getFootballers() {
        List<Footballer> all = footballerService.findAll();
        Function<Collection<Footballer>, GetFootballersResponse> mapper = GetFootballersResponse.entityToDtoMapper();
        GetFootballersResponse response = mapper.apply(all);
        return ResponseEntity.ok(response);
    }


    @GetMapping("{id}")
    public ResponseEntity<GetFootballerResponse> getFootballer(@PathVariable("id") int id) {
        return  footballerService.find(id)
                .map(value -> ResponseEntity.ok(GetFootballerResponse.entityToDtoMapper().apply(value)))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }



    @PostMapping
    public ResponseEntity<Void> createFootballer(@RequestBody CreateFootballerRequest request, UriComponentsBuilder builder){
        Footballer footballer = CreateFootballerRequest
                .dtoToEntityMapper(test-> coachService.find(test).orElseThrow())
                .apply(request);

            footballer = footballerService.save(footballer);
            return ResponseEntity.created(builder.pathSegment("api","footballers","{test}").buildAndExpand(footballer.getName()).toUri()).build();

    }

    @PutMapping("{id}")
    public ResponseEntity<Void> updateFootballer(@RequestBody UpdateFootballerRequest request, @PathVariable("id") int id) {
        Optional<Footballer> footballer = footballerService.find(id);
        if (footballer.isPresent()) {
            footballerService.update(UpdateFootballerRequest.dtoToEntityUpdater().apply(footballer.get(), request));
            return ResponseEntity.accepted().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("{id}")
    public ResponseEntity<Void> deleteFootballer(@PathVariable("id") int id) {
        Optional<Footballer> footballer = footballerService.find(id);
        if(!footballer.isPresent()) {
            return ResponseEntity.notFound().build();
        }
        footballerService.delete(footballer.get());
        return ResponseEntity.ok().build();
    }

}
