package multiThreaded.Client;


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
        System.out.println("Enter firstNumber");
        Integer firstNumber = Integer.valueOf(myObj.nextLine().trim()); // Trim the input
        System.out.println("Enter secondNumber");
        Integer secondNumber = Integer.valueOf(myObj.nextLine().trim());
        try{

            TCPClient client = new TCPClient(ipAddress,portNumber);
            client.computeSum(firstNumber,secondNumber);
        }
        catch (Exception e){
            System.out.println(Arrays.toString(e.getStackTrace()));
            System.out.println(e.toString());
        }
    }
    }

