package TwoUsers.Server;

import TwoUsers.Message.SocketMessageHandler;
import TwoUsers.Message.SharedBuffer;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class TCPServer implements Runnable {
    Integer portNumber;
    ServerSocket serverSocket;
    SharedBuffer consumerBuffer ;
    SharedBuffer publisherBuffer;
    public  TCPServer(Integer portNumber, SharedBuffer consumerBuffer, SharedBuffer publisherBuffer) throws IOException {
        this.portNumber = portNumber;
        this.consumerBuffer = consumerBuffer;
        this.publisherBuffer = publisherBuffer;
        this.serverSocket = new ServerSocket(portNumber);
    }

    @Override
    public void run() {
        System.out.println("TwoUsers: Server Started \n");
        while (true){
            Socket clientSocket = null;
            try {
                clientSocket = serverSocket.accept();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            System.out.println("Starting new Thread for " + clientSocket.getPort());
            Thread thread = new Thread(new SocketMessageHandler(clientSocket,consumerBuffer,publisherBuffer));
            thread.start();
        }
    }
}








