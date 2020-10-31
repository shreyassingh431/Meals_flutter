import 'package:flutter/material.dart';
import 'package:meals/widget/categories_screen.dart';
import 'package:meals/widget/favourite_screen.dart';

class TabsScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return _TabsScreenState();
  }

}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {

      return DefaultTabController(length: 2 , initialIndex:1, child:  Scaffold(
        appBar:  AppBar(title: Text('Meals'), bottom: TabBar(tabs: <Widget>[
          Tab(icon: Icon(Icons.category), text: 'Categories',),
          Tab(icon: Icon(Icons.star), text: 'Favourites',)
        ],),),
        body: TabBarView(children: <Widget>[
          CategoriesScreen(),
          FavoutiteScreen(),
        ]),
      ),);
  }
}


