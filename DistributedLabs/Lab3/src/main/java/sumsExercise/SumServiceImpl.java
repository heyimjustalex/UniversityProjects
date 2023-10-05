package sumsExercise;

import com.example.grpc.SumServiceGrpc.SumServiceImplBase;
import com.example.grpc.SumServiceOuterClass.SimpleSumRequest;
import com.example.grpc.SumServiceOuterClass.SumResponse;
import com.example.grpc.SumServiceOuterClass.RepeatedSumRequest;
import io.grpc.stub.StreamObserver;

import java.util.List;

public class SumServiceImpl extends SumServiceImplBase {

    @Override
    public void simpleSum(SimpleSumRequest request, StreamObserver<SumResponse> responseObserver) {

        List<Integer> numbers = request.getNumbersList();
        Integer sum = numbers.stream().reduce(0, Integer::sum);
        responseObserver.onNext(SumResponse.newBuilder().setSum(sum).build());
        responseObserver.onCompleted();
    }

    @Override
    public void repeatedSum(RepeatedSumRequest request, StreamObserver<SumResponse> responseObserver) {
        Integer n = request.getN();
        Integer t = request.getT();
        Integer sum=1;
        for (int i=1;i<=t;i++)
        {
            sum=t*n;
            responseObserver.onNext(SumResponse.newBuilder().setSum(sum).build());
        }
        responseObserver.onCompleted();
    }

    @Override
    public StreamObserver<SimpleSumRequest> streamSum(StreamObserver<SumResponse> responseObserver) {
        return new StreamObserver<SimpleSumRequest>() {
            @Override
            public void onNext(SimpleSumRequest request) {

                System.out.println("Got request " + request);
                responseObserver.onNext(SumResponse.newBuilder().setSum(request.getNumbersList().stream().reduce(0, Integer::sum)).build());

            }

            @Override
            public void onError(Throwable t) {

            }

            @Override
            public void onCompleted() {

            }
        };
    }
}
