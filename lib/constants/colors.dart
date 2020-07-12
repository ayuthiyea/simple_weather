/*
*   @file       color.dart
*   @project    Simple weather
*   @purpose    Colors
*   @author     Athear Sky on 07/12/20
*   @copyright  Athear Sky
*/

import 'package:flutter/material.dart';

class MyColors {
  //  Remove default constructor
  MyColors._internal();

  /*
  *   Primary color
  *
  *   @return           Color
  */
  static primary() {
    return Color.fromARGB(255, 0, 0, 200);
  }

  /*
  *   Text color
  *
  *   @return           Color
  */
  static text() {
    return Color.fromARGB(255, 13, 36, 42);
  }

  /*
  *   Sub text color
  *
  *   @return           Color
  */
  static subText() {
    return Color.fromARGB(255, 130, 140, 150);
  }

  /*
  *   Border color
  *
  *   @return           Color
  */
  static borderColor() {
    return Color.fromARGB(255, 214, 221, 227);
  }

  /*
  *   Background color
  *
  *   @return           Color
  */
  static backgroundColor() {
    return Color.fromARGB(255, 239, 239, 239);
  }
}