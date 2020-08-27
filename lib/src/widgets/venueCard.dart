import 'package:flutter/material.dart';
import '../models/venue.dart';

class VenueCard extends StatelessWidget {
  VenueCard({this.venue});

  final Venue venue;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          Container(
              height: 100.0,
              width: 200.0,
              child: Image.asset(venue.imagePath, fit: BoxFit.cover)),
          Positioned(
            left: 10.0,
            top: 5.0,
            child: Text(
              venue.name,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
