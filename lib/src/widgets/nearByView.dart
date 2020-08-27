import 'package:flutter/material.dart';
import '../widgets/venueCard.dart';
import '../models/venue.dart';

import '../data/venueData.dart';

class NearByView extends StatelessWidget {
  final List<Venue> _venues = venues;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _venues.length,
          itemBuilder: (BuildContext context, int index) {
            return VenueCard(venue: _venues[index]);
          }),
    );
  }
}
