import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/widget/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  // final String CategoryId;                  // TODO: No need when pushNamed() is used
  // final String CategoryTitle;
  // CategoryMealScreen(this.CategoryId, this.CategoryTitle);

  static const screenPresenterName = '/category-meals';

  CategoryMealScreen();

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String CategoryTitle;
  List<Meal> displayedMeals;
  bool isLoadedInit = false;

  @override
  void initState() {

    // TODO: initState() is too early for conetxt
    super.initState();
  }

  void _removalMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: as context is initialized only after widget is build so didChangeDependencies execute after context initialized and build runs

    if(!isLoadedInit){
      final routesArg =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      //TODO Explanation: above line nothing '.settings' fetch info of RouteTable and says the arguments data is of type Map and stores in var

      CategoryTitle = routesArg['title'];
      final String CategoryId = routesArg['id'];
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(CategoryId);
      }).toList();

      isLoadedInit = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(CategoryTitle)),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imgUrl: displayedMeals[index].imageUrl,
                duration: displayedMeals[index].duration,
                complexity: displayedMeals[index].complexity,
                affordability: displayedMeals[index].affordability,
                removeItem: _removalMeal);
          },
          itemCount: displayedMeals.length,
        ));
  }
}
