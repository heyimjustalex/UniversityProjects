package pl.edu.aui.laboratorium.Event;
import lombok.*;
import pl.edu.aui.laboratorium.Entity.Coach;
import java.util.function.Function;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode

public class CreateCoachRequest {
    private String name;

    public static Function<Coach, CreateCoachRequest> entityToDtoMapper() {
        return entity -> CreateCoachRequest.builder()
                .name(entity.getName())
                .build();
    }
}
