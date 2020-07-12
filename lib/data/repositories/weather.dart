/*
*   @file       weather.dart
*   @project    Simple weather
*   @purpose    Weather repository to connect with datasource
*   @author     Athear Sky on 07/02/20
*   @copyright  Athear Sky
*/

import 'dart:convert';
import 'dart:io';

import 'package:simple_weather/data/apis/provider.dart';
import 'package:simple_weather/models/forecast.dart';
import 'package:simple_weather/utilities/parsed_response.dart';

class WeatherRepository {
  String _tag = 'weather';

  /*
  *   Get weather forecast by city
  *
  *   @param              cityID                int                       City ID
  *
  *   @return                                   Future<ParsedResponse<Forecast>>
  */
  Future<ParsedResponse<Forecast>> forecast({int cityId}) async {
    try {
      final response = await APIProvider.weather.forecast(cityId: cityId);
      final Map<String, dynamic> responseJson = json.decode(response.body);

      //  Case: success
      if (response.statusCode == HttpStatus.ok) {
        return ParsedResponse(
          code: response.statusCode,
          tag: _tag,
          result: Forecast.fromJson(responseJson),
        );
      }
      //  Case: error
      else {
        return ParsedResponse(
          code: HttpStatus.internalServerError,
        );
      }
    }
    //  Case: no Internet connection
    catch (_) {
      return ParsedResponse(
        code: HttpStatus.serviceUnavailable,
      );
    }
  }
}
