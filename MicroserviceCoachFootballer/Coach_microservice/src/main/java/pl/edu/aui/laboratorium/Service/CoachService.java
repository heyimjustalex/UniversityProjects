package pl.edu.aui.laboratorium.Service;
import pl.edu.aui.laboratorium.Entity.Coach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.edu.aui.laboratorium.Event.EventCoachRepository;
import pl.edu.aui.laboratorium.Repository.CoachRepository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;


@Service
public class CoachService
{
    private CoachRepository repository;
    private EventCoachRepository eventCoachRepository;

    @Autowired
    public CoachService(CoachRepository repository, EventCoachRepository eventCoachRepository)
    {
        this.repository = repository;
        this.eventCoachRepository = eventCoachRepository;
    }


    public List<Coach> findAll()
    {
        return repository.findAll();
    }

    public Optional<Coach> find(Integer id) {
        return repository.findById(id);
    }

    @Transactional
    public Coach save(Coach entity, boolean isInitializer)
    {
        if(!isInitializer)
        {
            eventCoachRepository.create(entity);
        }

        return repository.save(entity);
    }

    public void delete(Coach entity)
    {
        eventCoachRepository.delete(entity);
        repository.delete(entity);
    }

    @Transactional
    public void update(Coach entity) { repository.save(entity);}

    public Optional<Coach> findCoach(Coach coach) {
        return repository.findById(coach.getId());
    }

    public Optional<Coach> findByName(String name) {
        return repository.findByName(name);
    }
}
