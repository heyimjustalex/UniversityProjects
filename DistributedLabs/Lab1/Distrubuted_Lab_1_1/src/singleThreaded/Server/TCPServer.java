package singleThreaded.Server;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

public class TCPServer {

    Integer portNumber;
    ServerSocket serverSocket;

    public  TCPServer(Integer portNumber) throws IOException {
        this.portNumber = portNumber;
        serverSocket = new ServerSocket(portNumber);
    }

    public void start() throws IOException {
        System.out.println("Server Started \n");
        while (true){
            Socket clientSocket = serverSocket.accept();

            DataInputStream inFromClient = new DataInputStream(clientSocket.getInputStream());

            // Read integers sent from client
            int firstNumber = inFromClient.readInt();
            int secondNumber = inFromClient.readInt();
            System.out.println(firstNumber);
            System.out.println(secondNumber);
            // Calculate sum
            int sum = firstNumber + secondNumber;

            // Send sum back to client
            DataOutputStream outToClient = new DataOutputStream(clientSocket.getOutputStream());
            outToClient.writeInt(sum);

            // Close client socket
            clientSocket.close();
        }
    }


}

