import 'package:flutter/material.dart';
import 'package:gotya/src/data/productsData.dart';
import 'package:gotya/src/helpers/colors.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:gotya/src/models/product.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {
  FavoriteButton({this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final listMode = Provider.of<ProductsData>(context);
    return GestureDetector(
      onTap: () {
        listMode.toggleFavoriteButton(product);
        final player = AudioCache();
        player.play('sounds/Tap.wav');
      },
      child: product.isFavorite
          ? Icon(
              Icons.favorite,
              size: 33.0,
              color: secondaryColor,
            )
          : Icon(
              Icons.favorite_border,
              size: 33.0,
              color: secondaryColor,
            ),
    );
  }
}
