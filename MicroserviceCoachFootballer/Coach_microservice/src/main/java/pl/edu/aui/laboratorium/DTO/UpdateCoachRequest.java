package pl.edu.aui.laboratorium.DTO;
import lombok.*;
import pl.edu.aui.laboratorium.Entity.Coach;
import java.util.function.BiFunction;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@ToString
@EqualsAndHashCode
public class UpdateCoachRequest {
    private String name;
    private String surname;


    public static BiFunction<Coach,UpdateCoachRequest, Coach> dtoToEntityUpdater(){
        return (coach,request) -> {
            coach.setName(request.name);
            coach.setSurname(request.surname);
            return coach;
        };
    }
}
