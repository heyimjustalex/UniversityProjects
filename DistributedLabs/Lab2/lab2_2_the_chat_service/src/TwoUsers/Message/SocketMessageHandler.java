package TwoUsers.Message;
import TwoUsers.Message.Message;
import TwoUsers.Message.SharedBuffer;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
public class SocketMessageHandler implements Runnable {
    private Socket clientSocket;
    SharedBuffer consumerBuffer ;
    SharedBuffer publisherBuffer;
    public SocketMessageHandler(Socket clientSocket, SharedBuffer consumerBuffer, SharedBuffer publisherBuffer){
        this.clientSocket = clientSocket;
        this.consumerBuffer = consumerBuffer;
        this.publisherBuffer = publisherBuffer;
    }

    public void run() {
//        System.out.println("Handler has been started!");

        Thread senderThread = new Thread(new TCPMessageSender());
        Thread receiverThread = new Thread(new TCPMessageReceiver());

        senderThread.start();
        receiverThread.start();

        try {
            senderThread.join();
            receiverThread.join();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

    }
    private class TCPMessageSender implements Runnable{
        @Override
        public void run() {
//            System.out.println("TCPMessageSender started! \n");
            try {
                ObjectOutputStream outToServer =
                        new ObjectOutputStream(clientSocket.getOutputStream());

                while(true){

                    Message message = publisherBuffer.getMessage();
                    outToServer.writeObject(message);
                    outToServer.flush();
                }

            } catch (IOException | InterruptedException e) {

                throw new RuntimeException(e);
            }
        }
    }

    private class  TCPMessageReceiver implements Runnable{

        @Override
        public void run() {
//            System.out.println("TCPMessageReceiver started! \n");
            try {
                ObjectInputStream inFromServer = new ObjectInputStream(clientSocket.getInputStream());
                while(true){

                    Message message = (Message) inFromServer.readObject();
                    consumerBuffer.addMessage(message);

                }

            } catch (IOException | InterruptedException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }


}

