package TwoUsers.Client;


import TwoUsers.Message.MessageConsumer;
import TwoUsers.Message.MessagePublisher;
import TwoUsers.Message.SharedBuffer;

import java.io.IOException;
import java.util.Arrays;

public class Program {
    public static void main(String[] args) throws IOException {

        Integer portNumber = Integer.valueOf(9999);
        String ipAddress = "localhost";
        String user = "ClientUser";

        SharedBuffer consumerBuffer = new SharedBuffer();
        SharedBuffer publisherBuffer = new SharedBuffer();
        Thread consumerThread = new Thread(new MessageConsumer(consumerBuffer, user));
        Thread publisherThread = new Thread(new MessagePublisher(publisherBuffer, user));
        Thread clientThread = new Thread(new TCPClient(ipAddress,portNumber, consumerBuffer,publisherBuffer));

        try{

            clientThread.start();
            consumerThread.start();
            // So the "Name:" appears after
            Thread.sleep(1000);
            publisherThread.start();

            clientThread.join();
            consumerThread.join();
            publisherThread.join();
        }
        catch (Exception e){
            System.out.println(Arrays.toString(e.getStackTrace()));
            System.out.println(e.toString());
        }
    }
    }

