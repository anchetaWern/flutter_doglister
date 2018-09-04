import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/dog_model.dart';
import 'dart:convert';
import 'widgets/card_list.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {

  bool _loaderIsActive = false;  
  List<DogModel> images = [];

  void fetchDog() async {
    setState(() {
      _loaderIsActive = true;
    });

    var response = await get('https://dog.ceo/api/breeds/image/random');
    var dogModel = DogModel(json.decode(response.body));
  
    setState(() {
      _loaderIsActive = false;
      images.add(dogModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: _loaderIsActive == true ? CircularProgressIndicator() : CardList(images)),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: fetchDog,
          backgroundColor: Colors.deepPurpleAccent[700],
        ),
        appBar: AppBar(
          title: Text('Doggos'),
          backgroundColor: Colors.black54,
        ),
      ),
    );
  }
}