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

public class GetCoachResponse {

    private int  id;
    private String name;
    private String surname;

    public static Function<Coach, GetCoachResponse> entityToDtoMapper() {
        return coach -> GetCoachResponse.builder()
                .id(coach.getId())
                .name(coach.getName())
                .surname(coach.getSurname())
                .build();

    }

}
