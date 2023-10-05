package theatreMultiThreadedSynchronized.Server;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.List;

class ClientHandler implements Runnable {
    private final Socket clientSocket;
    private final TicketsService ticketsService;
    public ClientHandler(Socket clientSocket, TicketsService ticketsService) {
        this.clientSocket = clientSocket; this.ticketsService = ticketsService;
    }

    @Override
    public void run() {
        try {
            DataInputStream inFromClient = new DataInputStream(clientSocket.getInputStream());
            DataOutputStream outToClient = new DataOutputStream(clientSocket.getOutputStream());

            String requestName = inFromClient.readUTF();
            System.out.println("REQUEST_NAME: "+requestName);
            if(requestName.equals("TICKET_REQUEST"))
            {
                Integer numberOfTickets  = inFromClient.readInt();
                System.out.println("NUMBER OF TICKETS: "+numberOfTickets);
                List<Integer> seatNumbers = ticketsService.reserveTicket(numberOfTickets);
                String seatNumbersResponse = seatNumbers.toString();
                outToClient.writeUTF(seatNumbersResponse);
            }

            clientSocket.close();
            System.out.println("Closing the connection for clientSocket port " + clientSocket.getPort());
        } catch (IOException e) {
            System.out.println("Error handling client connection: " + e.getMessage());
        }
    }
}