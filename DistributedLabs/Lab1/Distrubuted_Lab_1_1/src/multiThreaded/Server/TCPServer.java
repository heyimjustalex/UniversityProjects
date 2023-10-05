package multiThreaded.Server;

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
            System.out.println("Starting new Thread for " + clientSocket.getPort());
            Thread thread = new Thread(new ClientHandler(clientSocket));
            thread.start();



        }
    }


}








