import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotya/src/provider/listModeView.dart';
import 'package:gotya/src/widgets/searchField.dart';
import 'package:provider/provider.dart';

class ListMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listMode = Provider.of<ListModeView>(context);
    return Container(
      padding: EdgeInsets.only(left: 8.0),
      child: Row(
        children: <Widget>[
          !listMode.isActive
              ? SvgPicture.asset(
                  'assets/icons/filter.svg',
                  height: 20.0,
                  color: Colors.grey[600],
                )
              : Container(),
          !listMode.isActive
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset(
                    'assets/icons/sort.svg',
                    height: 28.0,
                    color: Colors.grey[600],
                  ),
                )
              : Container(),
          !listMode.isActive
              ? InkWell(
                  onTap: () {
                    listMode.changeListMode();
                  },
                  child: listMode.countValue == 2
                      ? SvgPicture.asset(
                          "assets/icons/listview.svg",
                          height: 26.0,
                          color: Colors.grey[600],
                        )
                      : SvgPicture.asset(
                          "assets/icons/layout.svg",
                          height: 21.0,
                          color: Colors.grey[600],
                        ),
                )
              : Container(),
          SearchField(),
        ],
      ),
    );
  }
}
