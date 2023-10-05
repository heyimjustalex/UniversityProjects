package theatreMultiThreadedSynchronized.Server;

import java.io.IOException;
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
        TicketsService ticketsService = new TicketsService();
        while (true){
            Socket clientSocket = serverSocket.accept();
            System.out.println("Starting new Thread for " + clientSocket.getPort());
            Thread thread = new Thread(new ClientHandler(clientSocket,ticketsService));
            thread.start();
        }
    }
}








