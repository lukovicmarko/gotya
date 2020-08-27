import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gotya/src/helpers/colors.dart';

class BreadCrumbs extends StatelessWidget {
  final List<String> _roots = ['Food', 'Business'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: BreadCrumb.builder(
        itemCount: _roots.length,
        builder: (index) {
          return BreadCrumbItem(
            content: Text(
              _roots[index],
              style: TextStyle(
                color: colorGrey,
                fontSize: 15.0,
              ),
            ),
          );
        },
        divider: Padding(
          padding: EdgeInsets.only(bottom: 2.0),
          child: Icon(
            FontAwesomeIcons.angleRight,
            size: 16.0,
          ),
        ),
      ),
    );
  }
}
