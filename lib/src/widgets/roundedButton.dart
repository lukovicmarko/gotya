import 'package:flutter/material.dart';
import 'package:gotya/src/helpers/colors.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.text, this.icon, this.padding, this.buttonFunction});

  final String text;
  final Widget icon;
  final double padding;
  final Function buttonFunction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonFunction,
      child: Container(
        height: 48.0,
        margin: EdgeInsets.only(bottom: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            Padding(
              padding: EdgeInsets.only(left: padding),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      // Expanded(
      //   child: Container(
      //       // width: double.infinity,
      //       margin: EdgeInsets.only(bottom: margin),
      //       padding: EdgeInsets.symmetric(vertical: padding),
      //       decoration: BoxDecoration(
      //         color: secondaryColor,
      //         borderRadius: BorderRadius.all(
      //           Radius.circular(5.0),
      //         ),
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           Container(
      //             child: icon,
      //           ),
      //           SizedBox(
      //             width: 20,
      //           ),
      //           Text(
      //             text,
      //             style: TextStyle(
      //               fontSize: 20.0,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ],
      //       )),
      // ),
    );
  }
}
