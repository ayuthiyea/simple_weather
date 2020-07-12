/*
*   @file       route.dart
*   @project    Simple weather
*   @purpose    Store all routes in the app
*   @author     Athear Sky on 07/12/20
*   @copyright  Athear
*/

import 'package:flutter/material.dart';

import 'package:simple_weather/views/home.dart';

class MyRoute {
  /*
  *   All routes
  *
  *   @return         Map<String, WidgetBuilder>
  */
  static Map<String, WidgetBuilder> allRoutes() {
    return {
      '/': (BuildContext context)                   => HomeView(),
    };
  }
}
