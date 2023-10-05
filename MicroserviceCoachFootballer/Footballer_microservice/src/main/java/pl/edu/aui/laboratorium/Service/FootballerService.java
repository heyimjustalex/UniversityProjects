package pl.edu.aui.laboratorium.Service;

import pl.edu.aui.laboratorium.Entity.Coach;
import pl.edu.aui.laboratorium.Entity.Footballer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.edu.aui.laboratorium.Repository.CoachRepository;
import pl.edu.aui.laboratorium.Repository.FootballerRepository;

import javax.transaction.Transactional;
import java.nio.channels.FileChannel;
import java.util.List;
import java.util.Optional;

@Service
public class FootballerService
{
    private FootballerRepository repository;
    private CoachRepository coachRepository;

    @Autowired
    public FootballerService (FootballerRepository repository,CoachRepository coachRepository)
    {
        this.repository = repository;
        this.coachRepository = coachRepository;
    }

    public Optional<Footballer> findByCoachIdFootballerId(Integer coachId, Integer footballerId) {
        Optional<Coach> coach = coachRepository.findById(coachId);
        if(coach.isPresent()) return repository.findByIdAndCoach(footballerId,coach.get());
        else return Optional.empty();
    }


    public List findAll()
    {
        return repository.findAll();
    }


    public List<Footballer> findAllByCoach(Coach coach) {return repository.findAllByCoach(coach); }

    @Transactional
    public void update(Footballer footballer) {
        repository.save(footballer);
    }


    public void delete(Footballer entity)
    {
        repository.delete(entity);
    }


    @Transactional
    public Optional<Footballer> find(Integer id) {
        return repository.findById(id);
    }

    @Transactional
    public Footballer save(Footballer entity) {
        return repository.save(entity);
    }

    public Optional<Footballer> findByName(String name) {
        return repository.findByName(name);
    }



}
