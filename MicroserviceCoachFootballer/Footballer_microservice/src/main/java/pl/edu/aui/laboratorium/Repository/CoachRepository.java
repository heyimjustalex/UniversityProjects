package pl.edu.aui.laboratorium.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.edu.aui.laboratorium.Entity.Coach;

import java.util.Optional;


@Repository
public interface CoachRepository extends JpaRepository<Coach, Integer> {


    Optional<Coach> findByName(String name);
}
