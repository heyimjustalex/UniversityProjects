package org.example;

import org.apache.commons.lang3.RandomStringUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

public class MedicalInterviewGenerator {

    WriterToCsvFile writer;

    public MedicalInterviewGenerator(String fileName) throws IOException {
        this.writer = new WriterToCsvFile(fileName);
    }

    public void generateMedicalInterviews(int howMany) {
        List<Object> columns = List.of("id_meeting", "hygiene", "treatment_story", "interview_description");
        writer.writeLineToFile(columns);


        ThreadLocalRandom random = ThreadLocalRandom.current();
        List<String> hygiene = List.of("good", "enough", "bad", "really bad");


        for (int i = 0; i < howMany; i++) {
            List<Object> meeting = new ArrayList<>();

            meeting.add(i+1);
            int index = random.nextInt(hygiene.size());
            meeting.add(hygiene.get(index));
            meeting.add(getRandomDescription());
            meeting.add(getRandomDescription());

            writer.writeLineToFile(meeting);
        }
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


    void closeWriter() {
        writer.closeWriter();
    }

}
