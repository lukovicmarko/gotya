import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gotya/src/models/product.dart';
import 'package:gotya/src/widgets/breadCrumbs.dart';
import 'package:gotya/src/widgets/companyCard.dart';
import 'package:gotya/src/widgets/linkCard.dart';
import 'package:gotya/src/widgets/productCardContainer.dart';
import 'package:gotya/src/widgets/productDescriptionCard.dart';
import 'package:gotya/src/widgets/productDetailsCard.dart';
import 'package:gotya/src/widgets/productView.dart';
import 'package:gotya/src/widgets/reviewCard.dart';

class ReviewDetailsPage extends StatelessWidget {
  ReviewDetailsPage({this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductCardContainer(product: product),
        BreadCrumbs(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: ReviewCard(review: product.reviews[0]),
        ),
        ProductDescriptionCard(product: product),
        CompanyCard(
          company: product.producer,
        ),
        ProductDetailsCard(product: product),
        LinkCard(
          icon: FontAwesomeIcons.globe,
          link: product.link,
        ),
        LinkCard(
          icon: FontAwesomeIcons.wikipediaW,
          link: product.wikipedia,
        ),
        ProductView()
      ],
    );
  }
}
