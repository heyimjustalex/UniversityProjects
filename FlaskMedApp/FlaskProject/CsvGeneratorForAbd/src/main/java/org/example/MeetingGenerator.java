package org.example;

import net.andreinc.mockneat.MockNeat;
import org.apache.commons.lang3.RandomStringUtils;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

public class MeetingGenerator {


    WriterToCsvFile writer;

    public MeetingGenerator(String fileName) throws IOException {
        this.writer = new WriterToCsvFile(fileName);
    }

    public void generateMeetings(int howMany) {
        List<Object> columns = List.of("id_doctor", "id_patient", "meeting_time", "meeting_description");
        writer.writeLineToFile(columns);


        ThreadLocalRandom random = ThreadLocalRandom.current();

        for (int i = 0; i < howMany; i++) {
            List<Object> meeting = new ArrayList<>();

            meeting.add(random.nextInt(500) + 1);
            meeting.add(random.nextInt(10000) + 1);


            if (i < howMany/2) {
                meeting.add(dateInPast());
                meeting.add(getRandomDescription());
            } else {
                meeting.add(dateInFuture());
                meeting.add("None");
            }
            writer.writeLineToFile(meeting);
        }

    }


    void closeWriter() {
        writer.closeWriter();
    }

    private static String getRandomDescription() {
        List<String> strings = List.of("lorem", "ipsum", "dolor", "sit", "amet,", "consectetur", "adipiscing", "elit,", "sed", "do", "eiusmod", "tempor", "incididunt", "ut", "labore", "et", "dolore", "magna", "aliqua", "Ut", "enim", "ad", "minim", "veniam,", "quis", "nostrud", "exercitation", "ullamco", "laboris", "nisi", "ut", "aliquip", "ex", "ea", "commodo", "consequat", "Duis", "aute", "irure", "dolor", "in", "reprehenderit", "in", "voluptate", "velit", "esse", "cillum", "dolore", "eu", "fugiat", "nulla", "pariatur", "Excepteur", "sint", "occaecat", "cupidatat", "non", "proident,", "sunt", "in", "culpa", "qui", "officia", "deserunt", "mollit", "anim", "id", "est", "laborum");
        StringBuilder random = new StringBuilder();
        Random r = new Random();
        for (int i = 0; i < 18; i++) {
            if (i == 0) {
                random.append(RandomStringUtils.randomAlphabetic(1).toUpperCase());
            }
            int index = r.nextInt(strings.size());
            random.append(strings.get(index));
            if(i!=17)random.append(" ");
        }
        return random + ".";
    }
    private String dateInPast() {
        MockNeat mock = MockNeat.threadLocal();
        LocalDate start = LocalDate.of(2019, 1, 1);
        LocalDate stop = LocalDate.of(2022, 11, 1);

        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MMM d u hh:mma", Locale.ENGLISH);

        LocalTime time1 = LocalTime.of(6, 0, 0);
        LocalTime time2 = LocalTime.of(17, 0, 0);
        int secondOfDayTime1 = time1.toSecondOfDay();
        int secondOfDayTime2 = time2.toSecondOfDay();
        Random random = new Random();
        int randomSecondOfDay = secondOfDayTime1 + random.nextInt(secondOfDayTime2 - secondOfDayTime1);
        LocalTime randomLocalTime = LocalTime.ofSecondOfDay(randomSecondOfDay);

        LocalDateTime between = mock.localDates().between(start, stop).val().atTime(randomLocalTime);
        return dateFormatter.format(between);
    }


    private String dateInFuture() {
        MockNeat mock = MockNeat.threadLocal();
        LocalDate start = LocalDate.of(2022, 12, 1);
        LocalDate stop = LocalDate.of(2023, 11, 1);

        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MMM d u hh:mma", Locale.ENGLISH);

        LocalTime time1 = LocalTime.of(6, 0, 0);
        LocalTime time2 = LocalTime.of(17, 0, 0);
        int secondOfDayTime1 = time1.toSecondOfDay();
        int secondOfDayTime2 = time2.toSecondOfDay();
        Random random = new Random();
        int randomSecondOfDay = secondOfDayTime1 + random.nextInt(secondOfDayTime2 - secondOfDayTime1);
        LocalTime randomLocalTime = LocalTime.ofSecondOfDay(randomSecondOfDay);

        LocalDateTime between = mock.localDates().between(start, stop).val().atTime(randomLocalTime);
        return dateFormatter.format(between);
    }
}
