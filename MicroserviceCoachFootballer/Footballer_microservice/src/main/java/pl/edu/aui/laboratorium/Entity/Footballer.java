package pl.edu.aui.laboratorium.Entity;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.UUID;

@SuperBuilder
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Entity

@Table(name="footballers")

public class Footballer
{
    @Id
    @Column(name="id")
    @GeneratedValue
    private int id;
    @Column (name="name")
    private String name;
    @Column (name = "surname")
    private String surname;
    @Column (name = "position")
    private String position;

    @ManyToOne
    @JoinColumn(name = "coach")
    private Coach coach;


    public Footballer(String name, String surname, String position, Coach coach) {

        this.name = name;
        this.surname = surname;
        this.position = position;
        this.coach = coach;
    }
    public Footballer(String name, String surname, String position) {

        this.name = name;
        this.surname = surname;
        this.position = position;
    }



    @Override
    public String toString() {
        return "Footballer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", position='" + position + '\'' +
                ", coach=" + coach +
                '}';
    }
}
