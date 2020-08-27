import 'package:gotya/src/models/productOption.dart';
import 'package:gotya/src/models/Review.dart';
import 'company.dart';

class Product {
  final String id;
  final String name;
  final String imagePath;
  final int rating;
  final double price;
  final String link;
  final String wikipedia;
  final String description;
  final String image;
  final String preparationTime;
  final String deliveryEstimation;
  final String unitPrice;
  final Company producer;
  final List<ProductOption> options;
  final List<Review> reviews;

  double total;
  int quantity;
  bool isFavorite;

  Product({
    this.id,
    this.name,
    this.imagePath,
    this.rating,
    this.price,
    this.link,
    this.wikipedia,
    this.description,
    this.image,
    this.producer,
    this.quantity,
    this.isFavorite,
    this.preparationTime,
    this.deliveryEstimation,
    this.unitPrice,
    this.total,
    this.options,
    this.reviews,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "imagePath": imagePath,
      "rating": rating,
      "price": price,
      "link": link,
      "wikipedia": wikipedia,
      "description": description,
      "image": image,
      "producer": producer,
      "quantity": quantity,
      "isFavorite": isFavorite,
      "preparationTime": preparationTime,
      "deliveryEstimation": deliveryEstimation,
      "unitPrice": unitPrice,
      "total": total,
      "options": options,
      "reviews": reviews,
    };
  }
}
