/*
*   @file       provider.dart
*   @project    simple weather
*   @purpose    Repository to centralize all repositories
*   @author     Athear Sky on 07/12/20
*   @copyright  Athear Sky
*/

import 'package:simple_weather/data/repositories/weather.dart';

class Repository {
  //  Remove default constructor
  Repository._internal();

  static final WeatherRepository weather = WeatherRepository();
}