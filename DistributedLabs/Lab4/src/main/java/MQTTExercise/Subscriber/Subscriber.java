package MQTTExercise.Subscriber;
import org.eclipse.paho.client.mqttv3.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Subscriber {
    private static List<Integer> lastTemperatures = new ArrayList<>();

    private static Double calculateAvgOfLastFiveElements(){
        int size = lastTemperatures.size();
        Double sum =0.0;
        for (int i = size - 1; i >= Math.max(size - 5, 0); i--) {
            sum += lastTemperatures.get(i);
        }
        return sum;
    }

    public static void main(String[] args) throws InterruptedException, MqttException {

        MqttClient client;
        String broker = "tcp://localhost:1883";
        String clientId = MqttClient.generateClientId();
        String subTopic = "home/sensors/#";
        String pubTopic = "home/controllers/temp";
        int qos = 2;

        try {
            client = new MqttClient(broker, clientId);
            MqttConnectOptions connOpts = new MqttConnectOptions();
            connOpts.setCleanSession(true);

            //Connect the client
            System.out.println(clientId + " Subscriber: Connecting Broker " + broker);
            client.connect(connOpts);
            System.out.println(clientId + " Subscriber: Connected " + Thread.currentThread().getId());

            //Callback
            client.setCallback(new MqttCallback() {

                public void messageArrived(String topic, MqttMessage message) throws MqttException {

                    String time = new Timestamp(System.currentTimeMillis()).toString();
                    String receivedMessage = new String(message.getPayload());
                    System.out.println(clientId +" Subscriber: Received a Message! - Callback - Thread PID: " + Thread.currentThread().getId() +
                            "\n\tTime:    " + time +
                            "\n\tTopic:   " + topic +
                            "\n\tMessage: " + receivedMessage +
                            "\n\tQoS:     " + message.getQos() + "\n");
                    System.out.println("\n ***  Press a random key to exit *** \n");

                    if(topic.equals("home/sensors/temp")){

                        Integer receivedNumber = Integer.parseInt(receivedMessage);

                        lastTemperatures.add(receivedNumber);
                        int n = lastTemperatures.size();
                        Double sum = calculateAvgOfLastFiveElements();
                        double avg =sum/n;
                        System.out.println("Subscriber: computed average " + avg);
                        if(avg>20){
                            MqttMessage messageToSend = new MqttMessage("ON".getBytes());
                            messageToSend.setQos(qos);
                            client.publish(pubTopic,messageToSend);
                            System.out.println(clientId + " Subscriber: Publishing message " + messageToSend);
                        }
                        else {
                            MqttMessage messageToSend = new MqttMessage("OFF".getBytes());
                            messageToSend.setQos(qos);
                            client.publish(pubTopic,messageToSend);
                            System.out.println(clientId + " Subscriber: Publishing message " + messageToSend);
                        }

                        if(n>=5){
                            lastTemperatures.remove(0);
                        }
                    }


                }

                public void connectionLost(Throwable cause) {
                    System.out.println(clientId + " Subscriber: Connection lost! cause:" + cause.getMessage() +  "-  Thread PID: " + Thread.currentThread().getId());
                }

                public void deliveryComplete(IMqttDeliveryToken token) {
                    if (token.isComplete()) {
                        System.out.println(clientId + " Subscriber: Message delivered - Thread PID: " + Thread.currentThread().getId());
                    }
                }

            });

            System.out.println(" Subscriber: "+clientId + " Subscribing ... - Thread PID: " + Thread.currentThread().getId());
            client.subscribe(subTopic,qos);
            System.out.println(" Subscriber: "+clientId + " Subscribed to topics : " + subTopic);

            System.out.println("\n ***  Press a random key to exit *** \n");
            Scanner command = new Scanner(System.in);
            command.nextLine();

            client.disconnect();



        } catch (MqttException me ) {
            System.out.println("reason " + me.getReasonCode());
            System.out.println("msg " + me.getMessage());
            System.out.println("loc " + me.getLocalizedMessage());
            System.out.println("cause " + me.getCause());
            System.out.println("excep " + me);
            me.printStackTrace();
        }


    }
}
