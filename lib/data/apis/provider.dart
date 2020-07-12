/*
*   @file       provider.dart
*   @project    Simple weather
*   @purpose    API provider to centralize all API providers
*   @author     Athear Sky on 07/11/20
*   @copyright  Athear sky
*/

import 'package:simple_weather/data/apis/weather.dart';

class APIProvider {
  //  Remove default constructor
  APIProvider._internal();

  static String base = 'https://api.openweathermap.org/';
  static String root = '${APIProvider.base}data/2.5/';

  static final WeatherAPIProvider weather = WeatherAPIProvider();
}