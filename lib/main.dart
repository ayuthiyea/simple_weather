/*
*   @file       main.dart
*   @project    Simple weather
*   @purpose    Entrance file to be executed when the app launches
*   @author     Athear Sky on 07/12/20
*   @copyright  Athear
*/

import 'package:flutter/material.dart';

import 'package:simple_weather/route.dart';

void main() async {
  runApp(
    MobileApp(),
  );
}

class MobileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      routes: MyRoute.allRoutes(),
    );
  }
}
