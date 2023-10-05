package singleThreaded.Server;

import java.util.Scanner;

public class Program {
    public static void main(String[] args) {
        System.out.println("SERVER PROGRAM");

        Scanner myObj = new Scanner(System.in);  // Create a Scanner object
        System.out.println("Enter server port");
        Integer portNumber = Integer.valueOf(myObj.nextLine());
        try{

            TCPServer server = new TCPServer(portNumber);
            server.start();
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

}
