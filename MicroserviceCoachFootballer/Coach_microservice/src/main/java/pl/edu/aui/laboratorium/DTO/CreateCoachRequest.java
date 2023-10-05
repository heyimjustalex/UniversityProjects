package pl.edu.aui.laboratorium.DTO;
import lombok.*;
import pl.edu.aui.laboratorium.Entity.Coach;
import java.util.function.Function;

@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@ToString
@EqualsAndHashCode
@Getter
@Setter

public class CreateCoachRequest
{
    private int  id;
    private String name;
    private String surname;

    public static Function<CreateCoachRequest, Coach> dtoToEntityMapper() {
        return req -> Coach.builder()
                .id(req.getId())
                .name(req.getName())
                .surname(req.getSurname())
                .build();
    }
}
