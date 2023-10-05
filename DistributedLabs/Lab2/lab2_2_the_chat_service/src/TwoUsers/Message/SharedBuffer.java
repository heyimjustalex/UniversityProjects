package TwoUsers.Message;
import java.util.LinkedList;
import java.util.Queue;
public class SharedBuffer {
    Queue<Message> queue = new LinkedList<Message>();
    public synchronized void addMessage(Message message) throws InterruptedException {
        while (queue.size()>3){
            wait();
        }
        queue.add(message);
        notify();
    }

    public synchronized Message getMessage() throws InterruptedException {
        while (queue.isEmpty())
        {
            wait();
        }
        Message message = queue.element();
        queue.remove(message);
        return message;
    }
}
