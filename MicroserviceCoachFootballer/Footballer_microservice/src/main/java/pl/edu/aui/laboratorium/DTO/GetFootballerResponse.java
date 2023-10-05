package pl.edu.aui.laboratorium.DTO;

import lombok.*;
import pl.edu.aui.laboratorium.Entity.Footballer;

import java.util.function.Function;
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@ToString
@EqualsAndHashCode

public class GetFootballerResponse {

    private int  id;
    private String name;
    private String surname;
    private String position;
    private int coach;


    public static Function<Footballer, GetFootballerResponse> entityToDtoMapper() {
        return footballer -> GetFootballerResponse.builder()
                .id(footballer.getId())
                .name(footballer.getName())
                .surname(footballer.getSurname())
                .position(footballer.getPosition())
                .coach(footballer.getCoach().getId())
                .build();
    }
}
