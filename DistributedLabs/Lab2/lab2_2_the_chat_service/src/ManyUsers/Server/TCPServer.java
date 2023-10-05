package ManyUsers.Server;

import ManyUsers.Message.Message;
import ManyUsers.Message.SharedBuffer;
import ManyUsers.Server.ServerSocketMessageHandler;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class TCPServer implements Runnable {
    Integer portNumber;
    ServerSocket serverSocket;
    SharedBuffer serverBuffer;
    List<Socket> clientSockets;
    List<ObjectOutputStream> clientSocketOutputStreams;
    private final Object lock = new Object(); // Object for synchronization

    public TCPServer(Integer portNumber, SharedBuffer serverBuffer) throws IOException {
        this.portNumber = portNumber;
        this.clientSockets = new ArrayList<>();
        this.clientSocketOutputStreams = new ArrayList<>();
        this.serverBuffer = serverBuffer;
        this.serverSocket = new ServerSocket(portNumber);
    }

    private void collectClientSocket(Socket clientSocket){
        synchronized (lock) {
            clientSockets.add(clientSocket);

            try {
               this.clientSocketOutputStreams.add(
                        new ObjectOutputStream(clientSocket.getOutputStream()));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

    }


    @Override
    public void run() {

        Thread senderThread = new Thread(new TCPMessageSender());
        senderThread.start();
        System.out.println("ManyUsers: Server Started \n");
        while (true) {
            Socket clientSocket = null;
            try {
                clientSocket = serverSocket.accept();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            this.collectClientSocket(clientSocket);
            System.out.println("Starting new Thread for client port " + clientSocket.getPort());
            Thread thread = new Thread(new ServerSocketMessageHandler(clientSocket, serverBuffer));
            thread.start();
        }
    }
    private class TCPMessageSender implements Runnable{
        @Override
        public void run() {
            try {
                while(true){
                    Message message = serverBuffer.getMessage();
                    // Here could be some logic not to send message to the same person who send it
                    for(ObjectOutputStream outputStream:clientSocketOutputStreams){
                        System.out.println("Broadcasting message "+message.user+" "+ message.text);
                        outputStream.writeObject(message);
                        outputStream.flush();
                    }
                }
            } catch (IOException | InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
    }

}








