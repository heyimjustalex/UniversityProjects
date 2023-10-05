package sumsExercise;

import io.grpc.ServerBuilder;

import java.io.IOException;


public class Server
{
    public static void main( String[] args )
    {
        try {

            io.grpc.Server server = ServerBuilder.forPort(8080).addService(new SumServiceImpl()).build();

            server.start();

            System.out.println("Server started!");

            server.awaitTermination();

        } catch (IOException e) {

            e.printStackTrace();

        } catch (InterruptedException e) {

            e.printStackTrace();

        }


    }
}
