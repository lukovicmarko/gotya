import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gotya/src/helpers/colors.dart';
import 'package:gotya/src/provider/listModeView.dart';
import 'package:provider/provider.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listMode = Provider.of<ListModeView>(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 42,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            padding: EdgeInsets.only(left: 20.0, bottom: 6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey[350],
                width: 3.0,
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    onTap: () {
                      listMode.changeIsActiveTrue();
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                !listMode.isActive
                    ? MaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: double.infinity,
                        minWidth: 50,
                        elevation: 0,
                        // color: Colorsys.orange,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Icon(
                            FontAwesomeIcons.search,
                            color: colorGrey,
                          ),
                        ),
                      )
                    : MaterialButton(
                        onPressed: () {
                          listMode.changeIsActiveFalse();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: double.infinity,
                        minWidth: 50,
                        elevation: 0,
                        // color: Colorsys.orange,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Icon(
                            FontAwesomeIcons.times,
                            color: colorGrey,
                          ),
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
