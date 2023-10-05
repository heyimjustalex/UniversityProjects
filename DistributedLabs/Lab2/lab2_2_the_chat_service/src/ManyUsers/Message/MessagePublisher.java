package ManyUsers.Message;

import java.util.Scanner;
public class MessagePublisher implements Runnable{
    SharedBuffer publishBuffer;
    String user;
    public MessagePublisher (SharedBuffer publishBuffer, String user){
        this.publishBuffer = publishBuffer;
        this.user = user;
    }

    @Override
    public void run() {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.print(user+": ");
            String text = scanner.nextLine().trim();
            try {
                this.publishBuffer.addMessage(new Message(this.user, text));

            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
