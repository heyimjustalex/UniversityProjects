package MQTTExercise.TemperaturePublisher;
import org.eclipse.paho.client.mqttv3.*;
import java.util.Random;

public class Publisher {

    public static void main(String[] args) throws InterruptedException, MqttException {
        Random rand = new Random();

        MqttClient client;
        String broker = "tcp://localhost:1883";
        String clientId = MqttClient.generateClientId();
        String topic = "home/sensors/temp";
        int qos = 2;
        client = new MqttClient(broker, clientId);
        MqttConnectOptions connOpts = new MqttConnectOptions();
        connOpts.setCleanSession(true);

        //Connect the client
        System.out.println(clientId + " Publisher: Connecting Broker " + broker);
        client.connect(connOpts);
        System.out.println(clientId + " Publisher: Connected");

        while (true)
        {
            int n = rand.nextInt(5) + 18;
            Thread.sleep(5000);

            try {
                // Create a random number between 0 and 10
                String payload = String.valueOf(n);
                MqttMessage message = new MqttMessage(payload.getBytes());

                //Set the QoS on the Message
                message.setQos(qos);
                System.out.println(clientId + " Publisher: Publishing message: " + payload + " ...");
                client.publish(topic, message);
                System.out.println(clientId + " Publisher: Message published");

//                if (client.isConnected())
//                    client.disconnect();
//                System.out.println("Publisher " + clientId + " disconnected");

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
}
