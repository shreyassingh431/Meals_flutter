import 'package:flutter/cupertino.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/widget/meal_item.dart';

class FavoutiteScreen extends StatelessWidget{
  final List<Meal> favouriteMeals;

  FavoutiteScreen(this.favouriteMeals);

  void _removalMeal(String mealId) {

  }

  @override
  Widget build(BuildContext context) {

    if(favouriteMeals.isEmpty){
      return Center(
        child: Text('You have no Favourites yet - start adding some!'),
      );
    }else{
     return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: favouriteMeals[index].id,
              title: favouriteMeals[index].title,
              imgUrl: favouriteMeals[index].imageUrl,
              duration: favouriteMeals[index].duration,
              complexity: favouriteMeals[index].complexity,
              affordability: favouriteMeals[index].affordability,
              removeItem: _removalMeal);
        },
        itemCount: favouriteMeals.length,
      );
    }

  }

}