package TwoUsers.Server;
import TwoUsers.Message.MessageConsumer;
import TwoUsers.Message.MessagePublisher;
import TwoUsers.Message.SharedBuffer;

public class Program {
    public static void main(String[] args) {

        Integer portNumber = 9999;

        try{
            SharedBuffer consumerBuffer = new SharedBuffer();
            SharedBuffer publisherBuffer = new SharedBuffer();
            Thread serverMainThread = new Thread(new TCPServer(portNumber,consumerBuffer,publisherBuffer));
            String user = "ServerUser";

            Thread consumerThread = new Thread(new MessageConsumer(consumerBuffer, user));
            Thread publisherThread = new Thread(new MessagePublisher(publisherBuffer, user));

            serverMainThread.start();
            consumerThread.start();
            // So the "Name:" appears after
            Thread.sleep(1000);
            publisherThread.start();


            serverMainThread.join();
            consumerThread.join();
            publisherThread.join();
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

}
