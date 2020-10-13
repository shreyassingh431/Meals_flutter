import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/widget/meal_item.dart';

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

    final String CategoryTitle= routesArg['title'];
    final String CategoryId = routesArg['id'];
    final selectedCategoryMeals = DUMMY_MEALS.where((meal) {

      return meal.categories.contains(CategoryId);

    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(CategoryTitle)),
      body: ListView.builder(itemBuilder: (ctx, index)  {

        return MealItem(title: selectedCategoryMeals[index].title,
            imgUrl: selectedCategoryMeals[index].imageUrl,
            duration: selectedCategoryMeals[index].duration,
            complexity: selectedCategoryMeals[index].complexity,
            affordability: selectedCategoryMeals[index].affordability);
      }, itemCount: selectedCategoryMeals.length,)
      );
  }
}
