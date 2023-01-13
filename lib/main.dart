import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websocket/provider/websocketprovider.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => WebSocketProvider(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
    const MyHomePage({Key? key}) : super(key: key);

  get child => null;
    

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WebSocketProvider>(context) ;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo websocket'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
           const Text('Events..'),
           TextButton(
            onPressed: (){
              provider.suscribir();
            },
             child: const Text('Suscribir al canal home')
            )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.connect_without_contact),
        onPressed:(){
          provider.connectar();
        }
      ),
    );
  }

}

