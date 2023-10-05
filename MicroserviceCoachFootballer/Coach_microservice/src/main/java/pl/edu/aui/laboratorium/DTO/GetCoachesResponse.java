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

public class GetCoachesResponse
{
    @Getter
    @Setter
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor(access = AccessLevel.PRIVATE)
    @ToString
    @EqualsAndHashCode

    public static class Coach
    {
        private int  id;
        private String name;
        private String surname;
    }
    @Singular
    private List<Coach> coaches;

    public static Function<Collection<pl.edu.aui.laboratorium.Entity.Coach>,GetCoachesResponse> entityToDtoMapper() {
        return coaches -> {
            GetCoachesResponseBuilder response = GetCoachesResponse.builder();
            coaches.stream()
                    .map(coach -> Coach.builder()
                            .id(coach.getId())
                            .name(coach.getName())
                            .surname(coach.getSurname())
                            .build())
                            .forEach(response::coach);
            return response.build();
        };
    }


}
