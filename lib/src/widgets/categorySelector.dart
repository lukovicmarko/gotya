import 'package:flutter/material.dart';
import 'package:gotya/src/data/categoriesData.dart';
import 'package:gotya/src/models/category.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<Category> _categories = categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Text(
                    _categories[index].name,
                    style: TextStyle(
                      fontSize: index == selectedIndex ? 17.0 : 16.5,
                      color: index == selectedIndex
                          ? Colors.black
                          : Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
