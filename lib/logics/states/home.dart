/*
*   @file       home.dart
*   @project    Simple weather
*   @purpose    All home states
*   @author     Athear Sky on 07/12/20
*   @copyright  Athear Sky
*/

import 'package:meta/meta.dart';

import 'package:simple_weather/models/forecast.dart';

abstract class HomeState {}

class HomeInitializationState extends HomeState {}

class HomeFetchingDataState extends HomeState {}

class HomeFetchedDataState extends HomeState {
  final Forecast forecast;

  HomeFetchedDataState({
    @required this.forecast,
  }) : assert(forecast != null);
}

class HomeInternetConnectionErrorState extends HomeState {
  final String message;
  final bool notify;
  final bool showAlert;

  HomeInternetConnectionErrorState({
    this.message,
    this.notify = false,
    this.showAlert = false,
  });
}

class HomeErrorState extends HomeState {
  final String message;
  final bool notify;
  final bool showAlert;

  HomeErrorState({
    this.message,
    this.notify = false,
    this.showAlert = false,
  });
}
