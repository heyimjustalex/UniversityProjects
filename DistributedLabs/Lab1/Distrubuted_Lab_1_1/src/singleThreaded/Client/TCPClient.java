package singleThreaded.Client;

import singleThreaded.Server.TCPServer;

import java.io.*;
import java.net.Socket;

public class TCPClient {
    String ipAddress;
    Integer portNumber;
    Socket clientSocket;

    Integer computedSum;




    public TCPClient(String ipAddress, Integer portNumber) throws IOException {
        this.ipAddress = ipAddress;
        this.portNumber = portNumber;
        this.clientSocket = new Socket(ipAddress, portNumber);
    }

    public void computeSum(Integer firstNumber, Integer secondNumber) throws IOException {
        System.out.println("Client Started \n");
        DataOutputStream outToServer =
                new DataOutputStream(clientSocket.getOutputStream());



        outToServer.writeInt(firstNumber);
        outToServer.writeInt(secondNumber);
        outToServer.flush();
        DataInputStream inFromServer = new DataInputStream(clientSocket.getInputStream());

        int sumFromServerString = inFromServer.readInt();
        System.out.println("SUM FROM SERVER : " + sumFromServerString);



        clientSocket.close();
    }


}
