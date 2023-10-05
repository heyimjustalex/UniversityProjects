package TwoUsers.Message;
import java.io.Serializable;
public class Message implements Serializable {
    public String user;
    public String text;


    public Message(String user, String text){
        this.user = user;
        this.text = text;
    }
}
