/*
*   @file       weather.dart
*   @project    Simple weather
*   @purpose    Weather API provider to communicate to server
*   @author     Athear Sky on 07/12/20
*   @copyright  Athear Sky
*/

import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:simple_weather/constants/env.dart';
import 'package:simple_weather/data/apis/provider.dart';

class WeatherAPIProvider {
  /*
  *   Get weather forecast by city
  *
  *   @param              cityID                int                       City ID
  *
  *   @return                                   Future<http.Response>
  */
  Future<http.Response> forecast({int cityId}) {
    final response = http.get(
      APIProvider.root + 'weather?id=$cityId&appid=${MyEnvironment.openWeatherAPIKey}',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    return response;
  }
}
