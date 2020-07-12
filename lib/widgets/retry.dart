/*
*   @file       retry.dart
*   @project    Simple weather
*   @purpose    Widget to show retry view when error
*   @author     Athear Sky on 07/12/20
*   @copyright  Athear Sky
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:simple_weather/constants/colors.dart';

class Retry extends StatelessWidget {
  final Widget child;
  final bool visible;
  final Function onRetry;

  /*
  *   Constructor
  *
  *   @param    child       Widget                  Child widget
  *   @param    visible     bool                    Whether to show the view
  *   @param    onRetry     Color                   Callback function when retry button is tapped
  */
  Retry({
    @required this.child,
    this.visible = false,
    this.onRetry,
  }) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    //  Case: visible
    if (visible) {
      return Container(
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.transparent,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Center(
                  child: Image(
                    width: 30.0,
                    image: AssetImage('assets/no_connection.png'),
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    'No Internet connection',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: CupertinoButton(
                    padding: EdgeInsets.all(0),
                    child: Text(
                      'Retry',
                      style: TextStyle(
                        color: MyColors.primary(),
                      ),
                    ),
                    onPressed: () {
                      onRetry();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    //  Case: hidden
    else {
      return child;
    }
  }
}
