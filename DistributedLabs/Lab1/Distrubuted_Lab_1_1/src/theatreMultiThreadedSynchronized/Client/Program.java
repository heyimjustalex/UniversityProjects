package theatreMultiThreadedSynchronized.Client;


import java.util.Arrays;
import java.util.Scanner;

public class Program {
    public static void main(String[] args) {
        System.out.println("CLIENT PROGRAM");
        Scanner myObj = new Scanner(System.in);  // Create a Scanner object
        System.out.println("Enter server port");
        Integer portNumber = Integer.valueOf(myObj.nextLine().trim()); // Trim the input
        System.out.println("Enter ip address");
        String ipAddress = myObj.nextLine().trim(); // Trim the input

        try{

            TCPClient client = new TCPClient(ipAddress,portNumber);
            client.reserveSeat(20);
            client.closeConnection();

        }
        catch (Exception e){
            System.out.println(Arrays.toString(e.getStackTrace()));
            System.out.println(e.toString());
        }
    }
    }

