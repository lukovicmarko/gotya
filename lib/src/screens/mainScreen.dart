import 'package:flutter/material.dart';
import 'package:gotya/src/provider/bottomNavigationBar.dart';
import 'package:gotya/src/widgets/appBar.dart';
import 'package:gotya/src/widgets/botomNavigation.dart';
import 'package:gotya/src/widgets/mainDrawer.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: MainDrawer(),
      body: provider.currentPage,
      bottomNavigationBar: buildBottomNavigationBar(provider),
    );
  }
}
