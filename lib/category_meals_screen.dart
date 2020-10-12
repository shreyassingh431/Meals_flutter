import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String CategoryId;                  // TODO: No need when pushNamed() is used
  // final String CategoryTitle;
  // CategoryMealScreen(this.CategoryId, this.CategoryTitle);

  static const screenPresenterName = '/category-meals';

  CategoryMealScreen();

  @override
  Widget build(BuildContext context) {
    final routesArg = ModalRoute.of(context).settings.arguments as Map<String, String >;
    //TODO Explanation: above line nothing '.settings' fetch info of RouteTable and says the arguments data is of type Map and stores in var
    final String CategoryId = routesArg['id'];
    final String CategoryTitle= routesArg['title'];
    return Scaffold(
      appBar: AppBar(title: Text(CategoryTitle)),
      body: Center(
        child: Text('Recipe of category'),
      ),
    );
  }
}
