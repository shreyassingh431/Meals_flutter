import 'package:flutter/material.dart';
import 'package:meals/screens_widget/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    //TODO Way 1: using push
    /*Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CategoryMealScreen(id,title);  // MaterialPageRoute returning MaterialPageRoute which is new screen widget
    },),);*/

    //TODO Way 2: using pushNamed method
    Navigator.of(ctx).pushNamed('/category-meals', arguments: {
      'id': id,
      'title': title,
    }); //TODO: arguments can take any datatype for eg: Object, map , int , string
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
                // this means colour from opacity to full colour
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
