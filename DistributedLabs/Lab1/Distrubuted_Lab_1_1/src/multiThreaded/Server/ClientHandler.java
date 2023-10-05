package multiThreaded.Server;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
class ClientHandler implements Runnable {
    private final Socket clientSocket;

    public ClientHandler(Socket clientSocket) {
        this.clientSocket = clientSocket;
    }

    @Override
    public void run() {
        try {
            DataInputStream inFromClient = new DataInputStream(clientSocket.getInputStream());

            // Read integers sent from client
            int firstNumber = inFromClient.readInt();
            int secondNumber = inFromClient.readInt();

            Thread.sleep(3000);

            // Calculate sum
            int sum = firstNumber + secondNumber;

            // Send sum back to client
            DataOutputStream outToClient = new DataOutputStream(clientSocket.getOutputStream());
            outToClient.writeInt(sum);

            // Close client socket
            clientSocket.close();
            System.out.println("Closing the connection for clientSocket port " + clientSocket.getPort());
        } catch (IOException e) {
            System.out.println("Error handling client connection: " + e.getMessage());
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
}