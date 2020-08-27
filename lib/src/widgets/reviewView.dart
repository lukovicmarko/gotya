import 'package:flutter/material.dart';
import 'package:gotya/src/models/product.dart';
import '../widgets/reviewCard.dart';

class ReviewView extends StatelessWidget {
  ReviewView({this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        children: product.reviews.map((review) {
          return ReviewCard(review: review);
        }).toList(),
      ),
    );
  }
}
