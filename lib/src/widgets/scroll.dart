import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gotya/src/helpers/colors.dart';

class Scroll extends StatefulWidget {
  final double max;
  final double min;
  final double value;
  final Function(double value) onSlideUpdate;
  final Function(double value) onSlideDone;

  Scroll({
    @required this.value,
    this.max = double.infinity,
    this.min = double.negativeInfinity,
    this.onSlideDone,
    this.onSlideUpdate,
  });

  @override
  _ScrollState createState() => _ScrollState();
}

class _ScrollState extends State<Scroll> with SingleTickerProviderStateMixin {
  double value;
  Offset dragStartOffset;
  double dragStartValue;
  AnimationController flingController;
  Animation<double> flingAnimation;
  void Function() currentFlingListener;

  @override
  void initState() {
    flingAnimation = AlwaysStoppedAnimation(0.0);
    flingController = AnimationController(vsync: this);
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double shadowOffset = 0.2;
    return GestureDetector(
      onVerticalDragStart: onDragStart,
      onVerticalDragUpdate: onDragUpdate,
      onVerticalDragEnd: onDragDone,
      child: Container(
        width: 22,
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, shadowOffset, 1.0 - shadowOffset, 1.0],
            colors: [secondaryColor, scrollColor, scrollColor, secondaryColor],
          ),
          border: Border.all(
            width: 1.5,
            style: BorderStyle.solid,
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(3.5),
        ),
        child: Container(
          child: Stack(
            children: List<Widget>.generate(
              11,
              (i) {
                var top = lineTopPos(value, i);
                return Positioned.fromRect(
                  rect: Rect.fromLTWH(
                    0.0,
                    top,
                    60,
                    0,
                  ),
                  child: Divider(
                    color: secondaryColor,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }

  double lineTopPos(double value, int i) {
    double valueFraction = (value.ceil() - value) * 10.0;
    double indexedTop = 10.0 * i;
    double top = indexedTop + valueFraction;
    return top;
  }

  void onDragStart(details) {
    // flingController.stop();
    // flingAnimation = AlwaysStoppedAnimation(0.0);
    setState(() {
      dragStartOffset = details.globalPosition;
      dragStartValue = value;
    });
  }

  void onDragUpdate(details) {
    // flingController.stop();
    // flingAnimation = AlwaysStoppedAnimation(0.0);
    var newValue = clamp(
        dragStartValue - (details.globalPosition - dragStartOffset).dy / 20.0,
        widget.min,
        widget.max);
    setState(() {
      value = newValue;
    });
    if (widget.onSlideUpdate != null) {
      widget.onSlideUpdate(value);
    }
  }

  void onDragDone(DragEndDetails details) {
    setState(() {
      dragStartOffset = null;
    });
    double velocity = details.primaryVelocity;
    if (velocity.abs() == 0) {
      if (widget.onSlideDone != null) {
        widget.onSlideDone(value);
      }
      return;
    }
    double originalValue = value;
    currentFlingListener = flingListener(originalValue);
    flingController.duration = Duration(milliseconds: velocity.abs().toInt());
    flingAnimation =
        Tween(begin: 0.0, end: velocity / 100).animate(CurvedAnimation(
      curve: Curves.decelerate,
      parent: flingController,
    ))
          ..addListener(currentFlingListener);
    flingController
      ..reset()
      ..forward();
  }

  flingListener(double originalValue) {
    return () {
      double newValue =
          clamp(originalValue - flingAnimation.value, widget.min, widget.max);
      if (newValue != value) {
        setState(() {
          value = newValue;
        });
        if (flingAnimation.value == flingController.upperBound) {
          if (widget.onSlideDone != null) {
            widget.onSlideDone(value);
          }
        } else {
          if (widget.onSlideUpdate != null) {
            widget.onSlideUpdate(value);
          }
        }
      }
    };
  }
}

double clamp<T extends num>(T number, T low, T high) =>
    max(low * 1.0, min(number * 1.0, high * 1.0));
