package theatreMultiThreadedSynchronized.Server;

import java.util.ArrayList;
import java.util.List;

public class TicketsService {
    Integer numberOfTickets = 200;
    public List<Integer> reserveTicket(Integer requestedNumber){
        List<Integer> seatNumbers = new ArrayList<Integer>();
        synchronized (this.numberOfTickets){
            if (requestedNumber>this.numberOfTickets){
                seatNumbers.add(0);
            }
            else {
                for (int i=0;i<requestedNumber;i++){
                    seatNumbers.add(numberOfTickets);
                    numberOfTickets--;
                }
            }
            return seatNumbers;
        }
    }
}
