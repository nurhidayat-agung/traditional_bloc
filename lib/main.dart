import 'package:flutter/material.dart';
import 'package:traditional_bloc/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc colorBloc = ColorBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    colorBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                colorBloc.eventSink.add(ColorEvent.to_amber);
              },
              backgroundColor: Colors.amber,
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                colorBloc.eventSink.add(ColorEvent.to_light_blue);
              },
              backgroundColor: Colors.lightBlue,
            )
          ],
        ),
        appBar: AppBar(
          title: Text("BLoC tanpa library"),
        ),
        body: Center(
          child: StreamBuilder(
            stream: colorBloc.stateStream,
            initialData: Colors.amber,
            builder: (context, snapshot) {
              return AnimatedContainer(
                width: 100,
                height: 100,
                color: snapshot.data,
                duration: Duration(microseconds: 500),
              );
            },
          ),
        ),
      ),
    );
  }
}
