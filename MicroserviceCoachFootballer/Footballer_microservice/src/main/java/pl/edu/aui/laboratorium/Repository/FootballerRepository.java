package pl.edu.aui.laboratorium.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.edu.aui.laboratorium.Entity.Coach;
import pl.edu.aui.laboratorium.Entity.Footballer;

import java.util.List;
import java.util.Optional;


public interface FootballerRepository extends JpaRepository<Footballer, Integer> {

    List<Footballer> findAllByCoach(Coach coach);

    Optional<Footballer> findByName(String name);
    Optional<Footballer> findByIdAndCoach(Integer id, Coach coach);

}
