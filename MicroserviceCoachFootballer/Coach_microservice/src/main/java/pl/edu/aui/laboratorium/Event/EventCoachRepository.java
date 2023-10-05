package pl.edu.aui.laboratorium.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.stereotype.Repository;
import org.springframework.web.client.RestTemplate;
import pl.edu.aui.laboratorium.Entity.Coach;
@Repository
public class EventCoachRepository {
    private RestTemplate restTemplate;

    @Autowired
    public EventCoachRepository(@Value("${my.app.url}") String baseUrl) {
        restTemplate = new RestTemplateBuilder().rootUri(baseUrl).build();
    }
    public void create(Coach coach) {
        restTemplate.postForLocation("/coaches", CreateCoachRequest.entityToDtoMapper().apply(coach));
    }

    public void delete(Coach coach) {
        restTemplate.delete("/coaches/{id}", coach.getId());
    }


}
