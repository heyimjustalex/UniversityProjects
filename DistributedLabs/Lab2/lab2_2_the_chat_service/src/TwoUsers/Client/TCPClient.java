package TwoUsers.Client;
import java.io.*;
import java.net.Socket;
import TwoUsers.Message.SharedBuffer;
import TwoUsers.Message.SocketMessageHandler;
public class TCPClient implements Runnable {
    String ipAddress;
    Integer portNumber;
    Socket clientSocket;
    SharedBuffer consumerBuffer ;
    SharedBuffer publisherBuffer;

    public TCPClient(String ipAddress, Integer portNumber, SharedBuffer consumerBuffer, SharedBuffer publisherBuffer) throws IOException {
        this.ipAddress = ipAddress;
        this.portNumber = portNumber;
        this.clientSocket = new Socket(ipAddress, portNumber);
        this.consumerBuffer = consumerBuffer;
        this.publisherBuffer = publisherBuffer;

    }

    @Override
    public void run() {
        System.out.println("TwoUsers: Client Started \n");
        Thread thread = new Thread(new SocketMessageHandler(clientSocket,consumerBuffer,publisherBuffer));
        thread.start();
        try {
            thread.join();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
    public void closeConnection() throws IOException {
        this.clientSocket.close();
    }
}
