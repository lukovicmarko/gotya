import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'dart:math';
import '../models/product.dart';

class ProductDescriptionCard extends StatefulWidget {
  ProductDescriptionCard({Key key, this.product}) : super(key: key);

  final Product product;
  @override
  _ProductDescriptionCardState createState() => _ProductDescriptionCardState();
}

class _ProductDescriptionCardState extends State<ProductDescriptionCard>
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
        margin: EdgeInsets.only(top: 3.0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expandable(
                collapsed: Text(
                  widget.product.description,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.0),
                ),
                expanded: Text(
                  widget.product.description,
                  softWrap: true,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
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
            ],
          ),
        ),
      ),
    );
  }
}
