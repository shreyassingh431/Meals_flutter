import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:meals/categories_screen.dart';
import 'package:meals/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
      //  canvasColor: Color.fromARGB(255 ,254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromARGB(20, 51, 51, 1)
          ),
          body2: TextStyle(
            color: Color.fromARGB(20, 51, 51, 1)
          ),
          title: TextStyle(
            fontSize:  20,
            fontFamily: 'RobotoCondensed',
            fontWeight: prefix0.FontWeight.bold

          )
        )
      ),
      home: CategoriesScreen(),
      routes: {
       // '/': (ctx) => CategoriesScreen() ,//TODO => this line is similar to home: CategoriesScreen(),
        CategoryMealScreen.screenPresenterName: (ctx) => CategoryMealScreen()}  // TODO: nothing but good practice for large project by registering screen to routes table and using by name
    );
  }
}



