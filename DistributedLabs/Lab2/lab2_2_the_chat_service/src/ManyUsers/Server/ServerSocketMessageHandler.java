package ManyUsers.Server;
import ManyUsers.Message.Message;
import ManyUsers.Message.SharedBuffer;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.net.Socket;

public class ServerSocketMessageHandler implements Runnable {
    private Socket clientSocket;
    SharedBuffer serverBuffer;
    public ServerSocketMessageHandler(Socket clientSocket, SharedBuffer serverBuffer){
        this.clientSocket = clientSocket;
        this.serverBuffer = serverBuffer;
    }

    public void run() {

        Thread receiverThread = new Thread(new TCPMessageReceiver());
        receiverThread.start();

        try {

            receiverThread.join();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
    private class  TCPMessageReceiver implements Runnable{
        @Override
        public void run() {
            System.out.println("TCPMessageReceiver started! \n");
            try {
                ObjectInputStream streamFromClient = new ObjectInputStream(clientSocket.getInputStream());
                while(true){

                    Message message = (Message) streamFromClient.readObject();
                    serverBuffer.addMessage(message);
                }

            } catch (IOException | InterruptedException | ClassNotFoundException e) {
                System.out.println("client disconnected");
            }
        }
    }


}

