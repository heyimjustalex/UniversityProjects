package org.example;

import com.github.javafaker.Faker;
import net.andreinc.mockneat.MockNeat;
import org.apache.commons.lang3.RandomStringUtils;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;

public class DoctorGenerator {

    WriterToCsvFile writer;

    public DoctorGenerator(String fileName) throws IOException {
        this.writer = new WriterToCsvFile(fileName);
    }

    public void generateDoctors(int howMany) {
        List<Object> columns = List.of("pesel", "name", "surname", "email", "phone_num", "born", "address", "disability", "medical_specialization");
        writer.writeLineToFile(columns);

        ThreadLocalRandom random = ThreadLocalRandom.current();
        Set<Long> pesels = new HashSet<>();
        while (pesels.size() < howMany) {
            pesels.add(random.nextLong(10_000_000_000L, 100_000_000_000L));
        }
        List<Long> peselsList = pesels.stream().toList();

        Faker faker = new Faker();

        HashSet<String> emails = new HashSet<>();
        while (emails.size() < howMany) {
            String generatedString = RandomStringUtils.randomAlphabetic(10);
            generatedString = generatedString + "@example.com";
            emails.add(generatedString);
        }
        List<String> emailsList = emails.stream().toList();

        Set<Long> phoneNums = new HashSet<>();
        while (phoneNums.size() < howMany) {
            phoneNums.add(random.nextLong(100_000_000L, 1_000_000_000L));
        }
        List<Long> phoneNumsList = phoneNums.stream().toList();


        MockNeat mock = MockNeat.threadLocal();
        LocalDate start = LocalDate.of(1925, 1, 1);
        LocalDate stop = LocalDate.of(2020, 1, 1);
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MMM d u", Locale.ENGLISH);


        List<String> medSpec = List.of(
                "Allergy and immunology",
                "Anesthesiology",
                "Dermatology",
                "Diagnostic radiology",
                "Emergency medicine",
                "Family medicine",
                "Internal medicine",
                "Medical genetics",
                "Neurology",
                "Nuclear medicine",
                "Obstetrics and gynecology",
                "Ophthalmology",
                "Pathology",
                "Pediatrics",
                "Physical medicine and rehabilitation",
                "Preventive medicine",
                "Psychiatry",
                "Surgery",
                "Urology",
                "Radiation oncology");

        for (int i = 0; i < howMany; i++) {
            List<Object> doctor = new ArrayList<>();
            doctor.add(peselsList.get(i));
            doctor.add(faker.name().firstName());
            doctor.add(faker.name().lastName());
            doctor.add(emailsList.get(i));
            doctor.add(phoneNumsList.get(i));
            doctor.add(getFormattedBorn(mock, start, stop, dateFormatter));
            doctor.add(faker.address().streetAddress());
            doctor.add((int) Math.round(Math.random()));
            int index = random.nextInt(medSpec.size());
            doctor.add(medSpec.get(index));
            writer.writeLineToFile(doctor);
        }

    }

    private static String getFormattedBorn(MockNeat mock, LocalDate start, LocalDate stop, DateTimeFormatter dateFormatter) {
        LocalDate between = mock.localDates().between(start, stop).val();
        return dateFormatter.format(between);
    }

    void closeWriter() {
        writer.closeWriter();
    }

}
