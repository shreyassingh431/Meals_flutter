import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget{
  static const routeName = '/filter-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FilterScreen'),
        ));
  }
}