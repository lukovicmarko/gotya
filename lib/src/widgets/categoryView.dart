import 'package:flutter/material.dart';
import '../widgets/categoryCard.dart';
import '../models/category.dart';

import '../data/categoriesData.dart';

class CategoryView extends StatelessWidget {
  final List<Category> _categories = categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryCard(category: _categories[index]);
          }),
    );
  }
}
