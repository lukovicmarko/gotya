import 'package:gotya/src/models/deliveredBy.dart';
import 'package:gotya/src/models/venue.dart';

import 'product.dart';

class Order {
  final String id;
  final String orderId;
  final String name;
  final double rating;
  final double total;
  final String date;
  final String time;
  final String courriersName;
  final double courriersNameRating;
  final String status;
  final String icon;
  final List<Product> products;
  final Venue venue;
  final DeliveredBy deliveredBy;

  Order({
    this.id,
    this.orderId,
    this.name,
    this.rating,
    this.total,
    this.date,
    this.time,
    this.courriersName,
    this.courriersNameRating,
    this.status,
    this.icon,
    this.products,
    this.venue,
    this.deliveredBy,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "orderId": orderId,
      "rating": rating,
      "total": total,
      "data": date,
      "time": time,
      "courriersName": courriersName,
      "courriersNameRating": courriersNameRating,
      "status": status,
      "icon": icon,
      "products": products,
      "venue": venue,
      "deliveredBy": deliveredBy
    };
  }
}
