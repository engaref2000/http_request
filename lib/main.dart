import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:http_request/src/model/image_model.dart';
import 'dart:convert';

import 'package:http_request/src/widgets/list_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<ImageModel> images = [];

  void getImage() async {
    _counter++;
    final uri = 'https://jsonplaceholder.typicode.com/photos/$_counter';
    final rs = await get(Uri.parse(uri));

    if (rs.statusCode == 200) {
      setState(() {
        final imageModel = ImageModel.fromJson(json.decode(rs.body));
        setState(() {
          images.add(imageModel);
        });
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ImageList(
        images: images,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'get new image ',
        child: const Icon(Icons.add),
      ),
    );
  }
}
