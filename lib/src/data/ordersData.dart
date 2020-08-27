import 'package:flutter/material.dart';
import 'package:gotya/src/models/deliveredBy.dart';
import 'package:gotya/src/models/venue.dart';
import 'package:gotya/src/models/productOption.dart';
import 'package:gotya/src/modules/http.dart';
import 'dart:collection';
import '../models/order.dart';
import '../models/product.dart';
import 'package:date_format/date_format.dart';

import '../models/productOptionItem.dart';
import '../models/Review.dart';

class OrdersData extends ChangeNotifier {
  List<Order> _orders = [];

  Future getOrders() async {
    RequestResult requestResult =
        RequestResult('http://vip_lane.microcommerce.site/orders/all');
    // RequestResult('http://192.168.0.10:8095/orders/all');

    var ordersResponse = await requestResult.getData();

    List<Order> orders = [];

    ordersResponse['items'].forEach((order) {
      List<Product> products = [];

      order['products'].forEach((product) {
        products.add(
          Product(
            id: product['id'],
            name: product['name'],
            price: product['price'].toDouble(),
            rating: product['rating'],
            imagePath: "assets/images/espresso.png",
            image: product['image'],
            quantity: product['quantity'],
            description: product['description'],
            link: product['website'],
            wikipedia: product['wikiPage'],
            deliveryEstimation: product['deliveryEstimation'],
            preparationTime: product['preparationTime'],
            unitPrice: product['unitPrice'],
            total: product['total'],
            producer: product['producer'],
            options: _buildProductOptions(product['options']),
            reviews: buildProductReviews(product['votes']),
            isFavorite: false,
          ),
        );
      });

      orders.add(
        Order(
          id: order['id'],
          orderId: order['name'],
          name: order['venue']['name'],
          total: order['total'].toDouble(),
          rating: order['venue']['rating'],
          date: formatOrderDate(order['createdAt']),
          time: formatOrderTime(order['createdAt']),
          courriersName: order['deliveredBy']['name'],
          courriersNameRating: order['deliveredBy']['rating'],
          status: "disputed",
          icon: "assets/icons/law.svg",
          products: products,
          venue: Venue(
            name: order['venue']['name'],
            description: order['venue']['description'],
            rating: order['venue']['rating'],
            imagePath: order['venue']['image'],
          ),
          deliveredBy: DeliveredBy(
            name: order['venue']['name'],
            description: order['venue']['description'],
            rating: order['venue']['rating'],
            imagePath: order['venue']['image'],
          ),
        ),
      );
    });

    _orders = orders;
    notifyListeners();
  }

  UnmodifiableListView<Order> get orders => UnmodifiableListView(_orders);

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
          isActive: item['isActive'],
        ),
      );
    });
    return items;
  }

  buildProductReviews(reviewsList) {
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

  formatOrderDate(order) {
    var date = DateTime.parse(order);
    var newFormat = formatDate(date, [dd, '/', mm, '/', yy]);
    return newFormat;
  }

  formatOrderTime(order) {
    var date = DateTime.parse(order);
    var newFormat = formatDate(date, [HH, ':', nn]);
    return newFormat;
  }
}
