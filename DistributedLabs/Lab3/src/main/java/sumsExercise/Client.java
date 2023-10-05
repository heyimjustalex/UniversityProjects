package sumsExercise;

import com.example.grpc.SumServiceGrpc;
import com.example.grpc.SumServiceOuterClass;
import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;
import io.grpc.stub.StreamObserver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class Client {

    public static void main(String[] args) throws InterruptedException {
        synchronousCall();
        asynchronousCall();
        asynchronousStreamCall();
    }
    public static void synchronousCall(){
        List<Integer> numbersList = Arrays.asList(0, 1, 1, 2,88);
        ManagedChannel channel = ManagedChannelBuilder.forTarget("localhost:8080").usePlaintext().build();
        SumServiceGrpc.SumServiceBlockingStub stub = SumServiceGrpc.newBlockingStub(channel);
        SumServiceOuterClass.SimpleSumRequest request = SumServiceOuterClass.SimpleSumRequest.newBuilder().addAllNumbers(numbersList).build();

        SumServiceOuterClass.SumResponse response = stub.simpleSum(request);
        System.out.println(response.getSum());

        channel.shutdown();

    }

    public static void asynchronousCall() throws InterruptedException {
        List<Integer> numbersList = Arrays.asList(0, 13, 21, 2,88);
        ManagedChannel channel = ManagedChannelBuilder.forTarget("localhost:8080").usePlaintext().build();
        SumServiceGrpc.SumServiceStub stub = SumServiceGrpc.newStub(channel);
        SumServiceOuterClass.SimpleSumRequest request = SumServiceOuterClass.SimpleSumRequest.newBuilder().addAllNumbers(numbersList).build();

        stub.simpleSum(request, new StreamObserver<>() {

            @Override
            public void onNext(SumServiceOuterClass.SumResponse res) {
                System.out.println(res.getSum());
            }

            @Override
            public void onError(Throwable t) {
                System.out.println(t.getMessage());
            }

            @Override
            public void onCompleted() {
                channel.shutdown();
            }
        });

        channel.awaitTermination(3000, TimeUnit.MILLISECONDS);

    }


    public static void asynchronousStreamCall() throws InterruptedException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        ManagedChannel channel = ManagedChannelBuilder.forTarget("localhost:8080").usePlaintext().build();
        SumServiceGrpc.SumServiceStub stub = SumServiceGrpc.newStub(channel);

        StreamObserver<SumServiceOuterClass.SimpleSumRequest> serverStream = stub.streamSum(new StreamObserver<>() {
            public void onNext(SumServiceOuterClass.SumResponse response) {
                System.out.println("Sum: " + response.getSum());
            }

            public void onError(Throwable throwable) {
            }

            public void onCompleted() {
            }
        });


        while(true){
            String input_numbers = null;
            try {
                input_numbers = br.readLine();
            } catch (IOException e) {
                e.printStackTrace();
            }

            if(input_numbers.equals("quit")){
                serverStream.onCompleted();
                break;
            }

            String[] split = input_numbers.split(" ");
            List<Integer> numbersList = new ArrayList<>();


            for (String numStr : split) {
                try {
                    int num = Integer.parseInt(numStr);
                    numbersList.add(num);
                } catch (NumberFormatException e) {
                    System.err.println("Invalid number format: " + numStr);
                }
            }

            serverStream.onNext(SumServiceOuterClass.SimpleSumRequest.newBuilder()
                    .addAllNumbers(numbersList)
                    .build());


        }


    }


}



