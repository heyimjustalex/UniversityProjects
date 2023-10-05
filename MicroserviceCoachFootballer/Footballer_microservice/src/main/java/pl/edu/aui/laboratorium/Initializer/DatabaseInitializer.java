package pl.edu.aui.laboratorium.Initializer;
import net.minidev.json.parser.JSONParser;
import net.minidev.json.parser.ParseException;
import org.h2.util.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.synchronoss.cloud.nio.multipart.util.IOUtils;
import pl.edu.aui.laboratorium.Entity.Coach;
import pl.edu.aui.laboratorium.Service.CoachService;
import pl.edu.aui.laboratorium.Entity.Footballer;
import pl.edu.aui.laboratorium.Service.FootballerService;
import javax.annotation.PostConstruct;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Optional;
import java.util.Scanner;


@Component
public class DatabaseInitializer
{
    private  CoachService coachService;
    private  FootballerService footballerService;

    @Autowired
    public DatabaseInitializer(CoachService coachService, FootballerService footballer)
    {
        this.coachService = coachService;
        this.footballerService = footballer;
    }

    @PostConstruct
    private synchronized void init() {


        Coach coach1 = new Coach("Alex1");
        Coach coach2 = new Coach("Alex2");
        Coach coach3 = new Coach("Alex3");

        Footballer footballer1 = new Footballer("John1","Smith1","Attack",coach1);
        Footballer footballer2 = new Footballer("John2","Smith2","Attack",coach1);
        Footballer footballer3 = new Footballer("John3","Smith3","Attack",coach1);
        Footballer footballer4 = new Footballer("John4","Smith4","Attack",coach2);
        Footballer footballer5 = new Footballer("John5","Smith5","Attack",coach2);
        Footballer footballer6 = new Footballer("John6","Smith6","Attack",coach3);
        Footballer footballer7 = new Footballer("John7","Smith7","Attack",coach3);


       coachService.save(coach1);
       coachService.save(coach2);
       coachService.save(coach3);


        footballerService.save(footballer1);
        footballerService.save(footballer2);
        footballerService.save(footballer3);
        footballerService.save(footballer4);
        footballerService.save(footballer5);
        footballerService.save(footballer6);
        footballerService.save(footballer7);

        List<Coach> coaches = coachService.findAll();
        List<Footballer> footballers = footballerService.findAll();


        for (Footballer footballer:footballers)
        {
            System.out.println(footballer.toString());
        }
        Integer test = footballer1.getId();

       // Optional<Coach> test2 = coachService.find(test);
       // List temp = coachService.findAll();
        //System.out.println("here");
    }

}
