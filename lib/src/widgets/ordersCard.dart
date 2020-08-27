import 'package:flutter/material.dart';
import 'package:gotya/src/data/cartData.dart';
import 'package:gotya/src/pages/cartPage.dart';
import 'package:gotya/src/provider/bottomNavigationBar.dart';
import 'package:gotya/src/widgets/ordersProductView.dart';
import 'package:gotya/src/widgets/roundedButton.dart';
import 'package:provider/provider.dart';
import '../helpers/colors.dart';
import './ordersRow.dart';
import '../models/order.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrdersCard extends StatefulWidget {
  OrdersCard({this.order});

  final Order order;

  @override
  _OrdersCardState createState() => _OrdersCardState();
}

class _OrdersCardState extends State<OrdersCard> {
  bool isExpanded = true;

  changeColor(String orderStatus) {
    if (orderStatus == "delivered") {
      return Colors.green;
    } else if (orderStatus == "canceled") {
      return Colors.red;
    } else {
      return secondaryColor;
    }
  }

  changeIconSize(String orderStatus) {
    if (orderStatus == "preparing" || orderStatus == "disputed") {
      return 20.0;
    } else if (orderStatus == "canceled") {
      return 15.0;
    } else {
      return 18.0;
    }
  }

  repeatOrder(cart) {
    widget.order.products.forEach((product) {
      cart.addToCart(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartData>(context);
    String status = widget.order.status;
    return Container(
      color: Colors.white,
      child: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Colors.black,
          unselectedWidgetColor: Colors.black,
        ),
        child: ListTileTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
          dense: true,
          child: ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    widget.order.name,
                    style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '${widget.order.total.toStringAsFixed(3)} KD',
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        '${widget.order.date} ${widget.order.time}',
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          repeatOrder(cart);
                          var provider =
                              Provider.of<BottomNavigationBarProvider>(context);
                          provider.currentPage = CartPage();
                        },
                        child: Opacity(
                          opacity: isExpanded ? 1.0 : 0.0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2.0,
                              horizontal: 3.0,
                            ),
                            margin: EdgeInsets.only(
                              left: 5.0,
                            ),
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/repeat.svg",
                              height: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: RoundedButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                              padding: 2.0,
                              text: "Add to favorites",
                            ),
                          ),
                          SizedBox(width: 30.0),
                          Expanded(
                            child: RoundedButton(
                              icon: SvgPicture.asset(
                                "assets/icons/repeat.svg",
                                height: 20.0,
                                color: Colors.white,
                              ),
                              padding: 8.0,
                              text: "Repeat Order",
                              buttonFunction: () {
                                repeatOrder(cart);
                                var provider =
                                    Provider.of<BottomNavigationBarProvider>(
                                        context);
                                provider.currentPage = CartPage();
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Order ID: ${widget.order.orderId}',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 17.0,
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "${status[0].toUpperCase()}${status.substring(1).toLowerCase()}: ",
                                  style: TextStyle(
                                    color: secondaryColor,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 3.0,
                                    bottom: 3.0,
                                  ),
                                  child: SvgPicture.asset(
                                    widget.order.icon,
                                    height: changeIconSize(status),
                                    color: changeColor(status),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      OrdersRow(
                        label: 'Venue: ',
                        title: widget.order.name,
                        rating: widget.order.rating,
                      ),
                      OrdersRow(
                        label: 'Delivered by: ',
                        title: widget.order.courriersName,
                        rating: widget.order.courriersNameRating,
                      ),
                    ],
                  ),
                ),
                OrdersProductView(order: widget.order),
              ],
              onExpansionChanged: (bool expanding) {
                setState(() {
                  isExpanded = !isExpanded;
                });
              }),
        ),
      ),
    );
  }
}
