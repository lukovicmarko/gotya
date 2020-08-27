import 'package:flutter/material.dart';
import 'package:gotya/src/models/company.dart';
import 'package:gotya/src/models/productOptionItem.dart';
import 'package:gotya/src/models/productOption.dart';
import 'package:gotya/src/models/Review.dart';
import 'package:gotya/src/modules/http.dart';
import 'dart:collection';
import '../models/product.dart';

class ProductsData extends ChangeNotifier {
  ProductsData() {
    getProducts();
  }

  List<Product> _products = [];

  Future getProducts() async {
    RequestResult requestResult =
        RequestResult('http://vip_lane.microcommerce.site/products/all');
    // RequestResult('http://192.168.0.10:8095/products/all');

    //'http://192.168.12.241:8095/products/all');

    var productsResponse = await requestResult.getData();

    productsResponse['items'].forEach((product) {
      _products.add(
        Product(
          id: product['id'],
          name: product['name'],
          price: product['priceTaxIncl'].toDouble(),
          rating: product['rating'],
          imagePath: "assets/images/espresso.png",
          image: product['images'][0],
          quantity: 1,
          description: product['description'],
          link: product['website'],
          wikipedia: product['wikiPage'],
          deliveryEstimation: product['deliveryEstimation'],
          preparationTime: product['preparationTime'],
          unitPrice: product['unitPrice'],
          total: 0.0,
          producer: Company(
            name: product['producer']['name'],
            description: product['producer']['description'],
            image: product['producer']['image'],
          ),
          options: _buildProductOptions(product['options']),
          reviews: _buildProductReviews(product['votes']),
          isFavorite: !product['isActive'],
        ),
      );
    });

    notifyListeners();
  }

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  _buildProductOptions(optionsList) {
    final List<ProductOption> options = [];
    optionsList.forEach((option) {
      options.add(
        ProductOption(
          name: option['name'],
          values: option['values'],
          items: _buildOptionsItems(option['items']),
          isRequired: option['isRequired'],
          isMultipleValuesAllowed: option['isMultipleValuesAllowed'],
        ),
      );
    });
    return options;
  }

  _buildOptionsItems(itemsList) {
    final List<ProductOptionItem> items = [];
    itemsList.forEach((item) {
      items.add(
        ProductOptionItem(
          name: item['name'],
          value: item['value'].toDouble(),
          price: item['price'].toDouble(),
        ),
      );
    });
    return items;
  }

  _buildProductReviews(reviewsList) {
    final List<Review> reviews = [];
    reviewsList.forEach((option) {
      reviews.add(
        Review(
          name: option['voterName'],
          rating: option['rating'],
          comment: option['comment'],
        ),
      );
    });
    return reviews;
  }

  void toggleFavoriteButton(product) {
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }

  void sliderOptions(product, newValue) {
    product.options[0].items[1].price = newValue;
    notifyListeners();
  }

  void toggleCheckBox(product, index, newValue) {
    product.options[1].items[index].isActive = newValue;
    notifyListeners();
  }
}
