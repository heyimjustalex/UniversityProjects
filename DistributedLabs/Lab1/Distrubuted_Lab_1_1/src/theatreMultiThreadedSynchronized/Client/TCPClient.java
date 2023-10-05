package theatreMultiThreadedSynchronized.Client;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

public class TCPClient {
    String ipAddress;
    Integer portNumber;
    Socket clientSocket;

    public TCPClient(String ipAddress, Integer portNumber) throws IOException {
        this.ipAddress = ipAddress;
        this.portNumber = portNumber;
        this.clientSocket = new Socket(ipAddress, portNumber);
    }

    public void reserveSeat(Integer numberOfSeats) throws IOException {
        System.out.println("Client Started \n");
        DataOutputStream outToServer =
                new DataOutputStream(clientSocket.getOutputStream());

        outToServer.writeUTF("TICKET_REQUEST");
        outToServer.flush();

        outToServer.writeInt(numberOfSeats);
        outToServer.flush();

        DataInputStream inFromServer = new DataInputStream(clientSocket.getInputStream());

        String seatNumbers = inFromServer.readUTF();
        String[] parts = seatNumbers.substring(1, seatNumbers.length() - 1).split(", ");

        if (parts.length > 0 && parts[0].charAt(0) == '0'){
            System.out.println("There are no that many seats: " + seatNumbers);
        }
        else {
            System.out.println("Your seat number(s) : " + seatNumbers);
        }

    }

    public void closeConnection() throws IOException {
        this.clientSocket.close();
    }

}
