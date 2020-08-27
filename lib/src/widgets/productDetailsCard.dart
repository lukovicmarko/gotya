import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gotya/src/models/product.dart';
import './reviewView.dart';
import 'package:expandable/expandable.dart';
import 'dart:math';

class ProductDetailsCard extends StatefulWidget {
  ProductDetailsCard({this.product});
  final Product product;
  @override
  _ProductDetailsCard createState() => _ProductDetailsCard();
}

class _ProductDetailsCard extends State<ProductDetailsCard>
    with TickerProviderStateMixin {
  Animation _arrowAnimation;
  AnimationController _arrowAnimationController;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Container(
        margin: EdgeInsets.only(bottom: 3.0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.solidStar),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          '4,6',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 19.0,
                          ),
                        ),
                        Text(
                          ' (2756) votes',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      var controller = ExpandableController.of(context);

                      return Container(
                        child: AnimatedBuilder(
                          animation: _arrowAnimationController,
                          builder: (context, child) => Transform.rotate(
                            angle: _arrowAnimation.value,
                            child: GestureDetector(
                              onTap: () {
                                controller.toggle();
                                _arrowAnimationController.isCompleted
                                    ? _arrowAnimationController.reverse()
                                    : _arrowAnimationController.forward();
                              },
                              child: Icon(
                                Icons.expand_more,
                                size: 25.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Expandable(
                expanded: ReviewView(product: widget.product),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
