package studentExercise;

import it.ewlab.student.StudentOuterClass.Student;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {

    public static void main(String[] args) throws IOException {

        System.out.println("The server is running...\n");

        ServerSocket serverSocket = new ServerSocket(9999);

        Socket s = serverSocket.accept();

        Student student = Student.parseFrom(s.getInputStream());

        System.out.println(student);
    }


}
