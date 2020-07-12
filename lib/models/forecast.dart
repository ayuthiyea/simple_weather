/*
*   @file       forecast.dart
*   @project    Simple weather
*   @purpose    Forecast model
*   @author     Athear Sky on 07/12/20
*   @copyright  Athear Sky
*/

import 'package:meta/meta.dart';

class Forecast {
  int id;
  String weather;
  String weatherDescription;


  Forecast({
    @required this.id,
    this.weather,
    this.weatherDescription,
  }) : assert(id != null);

  /*
  *   Create forecast object from json
  *   
  *   @param    jsn     json object
  *
  *   @return           void
  */
  Forecast.fromJson(Map<String, dynamic> jsn) {
    id = jsn['id'];
    if (jsn['weather'] != null) weather = jsn['weather'][0]['main'];
    if (jsn['weather'] != null) weatherDescription = jsn['weather'][0]['description'];
  }
}
