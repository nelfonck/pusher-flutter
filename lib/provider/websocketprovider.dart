import 'package:flutter/material.dart';
import 'package:pusher_client/pusher_client.dart';

class WebSocketProvider with ChangeNotifier {

  late PusherClient pusher ;

  WebSocketProvider();

  connectar() {
    PusherOptions options = PusherOptions(
      host: '192.168.100.173',
      wsPort: 6001,
      encrypted: false,
      );


      pusher = PusherClient(
      'abc12345',
      options,
      autoConnect: false
    );

    // connect at a later time than at instantiation.
    pusher.connect();

    pusher.onConnectionStateChange((state) {
      print("previousState: ${state?.previousState}, currentState: ${state?.currentState}");
    });

    pusher.onConnectionError((error) {
        print("error: ${error?.message}");
    });

  }

  suscribir(){
    // Subscribe to a private channel
    Channel channel = pusher.subscribe("home");

    // Bind to listen for events called "order-status-updated" sent to "private-orders" channel
    channel.bind("app.evento", (event) {
        print(event?.data);
    });

    // Unsubscribe from channel
    //pusher.unsubscribe("private-orders");
  }


}