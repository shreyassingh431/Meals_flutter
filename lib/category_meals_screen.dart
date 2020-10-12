import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  final String CategoryId;
  final String CategoryTitle;

  CategoryMealScreen(this.CategoryId, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(CategoryTitle)),
      body: Center(
        child: Text('Recipe of category'),
      ),
    );
  }
}
