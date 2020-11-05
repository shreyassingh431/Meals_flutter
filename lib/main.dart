import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/widget/bottom_tabs_screen.dart';
import 'package:meals/widget/categories_screen.dart';
import 'package:meals/widget/category_meals_screen.dart';
import 'package:meals/widget/filters_screen.dart';
import 'package:meals/widget/meal_detail_screen.dart';
import 'package:meals/widget/tabs_screen.dart';

import 'model/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          //  canvasColor: Color.fromARGB(255 ,254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                  //color: Color.fromARGB(20, 51, 51, 1)
                  ),
              body2: TextStyle(
                  //color: Color.fromARGB(20, 51, 51, 1)
                  ),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: prefix0.FontWeight.bold))),
      home: BottomTabsScreen(),
      //CategoriesScreen(), BottomTabsScreen(),TabsScreen()
      routes: {
        // '/': (ctx) => CategoriesScreen() ,//TODO => this line is similar to home: CategoriesScreen(),
        CategoryMealScreen.screenPresenterName: (ctx) => CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters,_setFilters),
      },
      // TODO: nothing but good practice for large project by registering screen to routes table and using by name
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
