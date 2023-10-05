package pl.edu.aui.laboratorium.Initializer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pl.edu.aui.laboratorium.Entity.Coach;
import pl.edu.aui.laboratorium.Service.CoachService;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.Optional;


@Component
public class DatabaseInitializer
{
    private  CoachService coachService;


    @Autowired
    public DatabaseInitializer(CoachService coachService)
    {
        this.coachService = coachService;
    }

    @PostConstruct
    private synchronized void init()
    {

        Coach coach1 = new Coach("Alex1","Surname1");
        Coach coach2 = new Coach("Alex2","Surname2");
        Coach coach3 = new Coach("Alex3","Surname3");



        coachService.save(coach1,true);
        coachService.save(coach2,true);
        coachService.save(coach3,true);



        List<Coach> coaches = coachService.findAll();


        for (Coach coach:coaches)
        {
            System.out.println(coach.toString());
        }


        List temp = coachService.findAll();


    }

}
