import 'package:flutter/material.dart';

showModal(BuildContext context, Widget child) async {
  await showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black45,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (BuildContext buildContext, Animation animation,
        Animation secondaryAnimation) {
      return StatefulBuilder(builder: (context, StateSetter setState) {
        return child;
      });
    },
  );
}
