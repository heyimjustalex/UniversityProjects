package pl.edu.aui.laboratorium.DTO;
import lombok.*;
import pl.edu.aui.laboratorium.Entity.Coach;
import pl.edu.aui.laboratorium.Entity.Footballer;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.function.Function;

@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@ToString
@EqualsAndHashCode
@Getter
@Setter

public class CreateFootballerRequest {
    private String name;
    private String surname;
    private String position;
    private Integer coach;


    public static Function<CreateFootballerRequest, Footballer> dtoToEntityMapper(Function<Integer, Coach> coach){
        return request -> Footballer.builder()
                .name(request.getName())
                .surname(request.getSurname())
                .position(request.getPosition())
                .coach(coach.apply(request.getCoach()))
                .build();
    }
}
