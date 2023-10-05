package pl.edu.aui.laboratorium.Controller;
import pl.edu.aui.laboratorium.DTO.CreateCoachRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;
import pl.edu.aui.laboratorium.Entity.Coach;
import pl.edu.aui.laboratorium.Service.CoachService;
import pl.edu.aui.laboratorium.Service.FootballerService;

import java.util.Optional;


@RestController
@RequestMapping("api/coaches")

public class CoachController
{
    CoachService coachService;
    FootballerService footballerService;

    @Autowired
    public CoachController(CoachService coachService, FootballerService footballerService)
    {
        this.coachService = coachService;
        this.footballerService = footballerService;
    }


    @PostMapping
    public ResponseEntity<Void> createCoach(@RequestBody CreateCoachRequest request, UriComponentsBuilder builder) {
        Coach coach = CreateCoachRequest
                .dtoToEntityMapper()
                .apply(request);

        coach = coachService.save(coach);
        return ResponseEntity.created(builder.pathSegment("api","coaches","{id}")
                .buildAndExpand(coach.getId()).toUri())
                .build();
    }


    @DeleteMapping("{id}")
    public ResponseEntity<Void> deleteCoach(@PathVariable("id") int id) {
        Optional<Coach> question = coachService.find(id);
        if(!question.isPresent()) {
            return ResponseEntity.notFound().build();
        }
        footballerService.findAllByCoach(question.get()).forEach(ans -> footballerService.delete(ans));
        coachService.delete(question.get());
        return ResponseEntity.ok().build();
    }
}
