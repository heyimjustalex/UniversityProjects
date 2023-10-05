package ManyUsers.Message;

import java.util.Objects;

public class MessageConsumer implements Runnable{
    SharedBuffer consumeBuffer;
    String user;
    public MessageConsumer(SharedBuffer consumeBuffer, String user){
        this.consumeBuffer = consumeBuffer;
        this.user = user;
    }
    @Override
    public void run() {
        while (true){

            try {
                Message message = consumeBuffer.getMessage();
                if (!Objects.equals(user, message.user)){
                System.out.println(message.user+": "+ message.text);

                }
            } catch (InterruptedException e) {
                System.out.println(e);
            }
        }
    }
}
