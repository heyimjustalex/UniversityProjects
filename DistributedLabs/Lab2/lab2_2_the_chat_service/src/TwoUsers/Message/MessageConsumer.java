package TwoUsers.Message;
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
                System.out.println(message.user+": "+ message.text);
            } catch (InterruptedException e) {
                System.out.println(e);
            }
        }
    }
}
