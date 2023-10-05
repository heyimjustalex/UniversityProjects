package pl.edu.aui.laboratorium.DTO;
import lombok.*;
import java.util.Collection;
import java.util.List;
import java.util.function.Function;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@ToString
@EqualsAndHashCode

public class GetFootballersResponse {

    @Getter
    @Setter
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor(access = AccessLevel.PRIVATE)
    @ToString
    @EqualsAndHashCode
    public static class Footballer {
        private Integer id;
        private String name;
        private String position;
        //private Integer id_Coach;


    }
    @Singular
    private List<Footballer> footballers;

    public static Function<Collection<pl.edu.aui.laboratorium.Entity.Footballer>, GetFootballersResponse> entityToDtoMapper() {
        return footballers-> {
            GetFootballersResponseBuilder response = GetFootballersResponse.builder();
            footballers.stream()
                    .map(footballer -> Footballer.builder()
                             .id(footballer.getId())
                             .name(footballer.getName())
                             .position(footballer.getPosition())
                            //.id_Coach(footballer.getCoach().getId())
                            .build())
                    .forEach(response::footballer);
            return response.build();
        };
    }
}
