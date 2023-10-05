package pl.edu.aui.laboratorium.Entity;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.List;
import java.util.UUID;

@SuperBuilder
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Entity

@Table(name="coaches")

public class Coach
{

    @Id
    @Column(name="id")
    @Getter
    @GeneratedValue(strategy = GenerationType.TABLE)
    private int id;
    @Column(name="name")
    private String name;
    @Column(name = "surname")
    private String surname;



    public Coach(String name, String surname)
    {
        this.name = name;
        this.surname = surname;
    }

    @Override
    public String toString() {
        return "Coach{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                '}';
    }

}
