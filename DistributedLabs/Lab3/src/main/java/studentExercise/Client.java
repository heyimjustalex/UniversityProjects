package studentExercise;


import it.ewlab.student.StudentOuterClass.Student;

import java.io.IOException;
import java.net.Socket;

public class Client {

    public static void main(String[] args) throws IOException {

        Socket s = new Socket("localhost", 9999);
        System.out.println("Socket started");
        Student student = Student.newBuilder()
                .setName("Alex")
                .setSurname("Abc")
                .setYear(1234)
                .setResidence(Student.Residence.newBuilder()
                            .setCity("Gdansk")
                            .setStreet("Wilenska")
                            .setNumber(22))
                .addExam(Student.Exam.newBuilder()
                        .setName("Distributed")
                        .setMark("5")
                        .build())
                .addExam(Student.Exam.newBuilder()
                        .setName("Cloud")
                        .setMark("4")
                        .build())
                .build();
        System.out.println(student);
        student.writeTo(s.getOutputStream());

        s.close();


    }
}
