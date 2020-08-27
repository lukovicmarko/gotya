import 'package:flutter/material.dart';
import 'package:gotya/src/models/category.dart';
import '../data/categoriesData.dart';

class CategoriesPage extends StatelessWidget {
  final List<Category> _categories = categories;

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 3.3;
    double cardHeight = MediaQuery.of(context).size.height / 8.8;
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: cardWidth / cardHeight,
      children: List.generate(_categories.length, (index) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: Colors.white),
              right: BorderSide(width: 1, color: Colors.white),
              bottom: BorderSide(width: 1, color: Colors.white),
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: 126.0,
                width: double.infinity,
                child: Image.asset(
                  _categories[index].image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 126.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  _categories[index].name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
