import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gotya/src/models/company.dart';
import 'dart:math';

class CompanyCard extends StatefulWidget {
  CompanyCard({Key key, this.company}) : super(key: key);

  final Company company;
  @override
  _CompanyCardState createState() => _CompanyCardState();
}

class _CompanyCardState extends State<CompanyCard>
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
        margin: EdgeInsets.symmetric(vertical: 3.0),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Expandable(
                    collapsed: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.industry),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: RichText(
                              text: TextSpan(
                                text: "",
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '[${widget.company.name}]',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${widget.company.description}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    expanded: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.industry),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: RichText(
                              text: TextSpan(
                                text: "",
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '[${widget.company.name}]',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${widget.company.description}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Column(
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
