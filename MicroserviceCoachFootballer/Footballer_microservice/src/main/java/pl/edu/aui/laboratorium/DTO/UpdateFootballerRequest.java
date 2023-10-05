package pl.edu.aui.laboratorium.DTO;
import lombok.*;
import pl.edu.aui.laboratorium.Entity.Coach;
import pl.edu.aui.laboratorium.Entity.Footballer;
import java.util.function.BiFunction;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@ToString
@EqualsAndHashCode

public class UpdateFootballerRequest
{
    private String name;
    private String surname;
    private String position;


    public static BiFunction<Footballer, UpdateFootballerRequest, Footballer> dtoToEntityUpdater() {
        return (footballer, request) -> {
            footballer.setName(request.getName());
            footballer.setSurname(request.getSurname());
            footballer.setPosition(request.getPosition());
            return footballer;
        };
    }
}
