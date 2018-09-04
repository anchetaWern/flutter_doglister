import 'package:flutter/material.dart';
import '../models/dog_model.dart';

class CardList extends StatelessWidget {
  final List<DogModel> images;
 
  CardList(this.images);

  Widget build(context) {
   
    if(this.images.length > 0){
      return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, int index) {
          return buildCard(images[index]);
        }
      );
    }

    return Center(child: Text('No doggos for you yet...'));
   
  }

  Widget buildCard(DogModel image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: Image.network(image.url),
    );
  }
}