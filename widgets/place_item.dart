import 'package:flutter/material.dart';
import '../models/place.dart';

class PlaceItem extends StatelessWidget {
  final Place place;

  PlaceItem({required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(place.name, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(place.description),
        ),
      ),
    );
  }
}
