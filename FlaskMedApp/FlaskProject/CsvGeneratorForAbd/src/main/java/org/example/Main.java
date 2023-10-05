package org.example;

import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {

        PatientsGenerator patientsGenerator = new PatientsGenerator("patients.csv");
        patientsGenerator.generatePatients(10000);
        patientsGenerator.closeWriter();

        DoctorGenerator doctorGenerator = new DoctorGenerator("doctors.csv");
        doctorGenerator.generateDoctors(500);
        doctorGenerator.closeWriter();

        MeetingGenerator meetingGenerator = new MeetingGenerator("meetings.csv");
        meetingGenerator.generateMeetings(20000);
        meetingGenerator.closeWriter();

        MedicalInterviewGenerator medicalInterviewGenerator = new MedicalInterviewGenerator("medicalInterviews.csv");
        medicalInterviewGenerator.generateMedicalInterviews(10000);
        medicalInterviewGenerator.closeWriter();
    }
}