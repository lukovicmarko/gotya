import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expandable/expandable.dart';
import 'package:gotya/src/helpers/colors.dart';
import '../models/Review.dart';

class ReviewCard extends StatefulWidget {
  ReviewCard({this.review});

  final Review review;

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 10.0),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            widget.review.name,
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              widget.review.rating.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                color: colorDarkGrey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 5.0),
                              child: Icon(
                                FontAwesomeIcons.solidStar,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: Expandable(
                              collapsed: Text(
                                widget.review.comment,
                                maxLines: 2,
                                softWrap: true,
                                style: TextStyle(fontSize: 15.0),
                              ),
                              expanded: Text(
                                widget.review.comment,
                                softWrap: true,
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            var controller = ExpandableController.of(context);
                            return Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: InkWell(
                                child: Icon(Icons.more_horiz),
                                onTap: () {
                                  controller.toggle();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
