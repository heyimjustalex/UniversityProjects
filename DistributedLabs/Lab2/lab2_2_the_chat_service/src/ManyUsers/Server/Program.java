package ManyUsers.Server;
import ManyUsers.Message.MessageConsumer;
import ManyUsers.Message.MessagePublisher;
import ManyUsers.Message.SharedBuffer;

public class Program {
    public static void main(String[] args) {

        Integer portNumber = 9999;

        try{
            SharedBuffer serverBuffer = new SharedBuffer();

            Thread serverMainThread = new Thread(new TCPServer(portNumber,serverBuffer));
            String user = "ServerUser";

            serverMainThread.start();
            serverMainThread.join();

        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

}
