/*
*   @file       home.dart
*   @project    Home service
*   @purpose    All home events
*   @author     Athear Sky on 07/12/20
*   @copyright  Athear Sky
*/

import 'package:meta/meta.dart';

abstract class HomeEvent {}

class HomeFetchDataEvent extends HomeEvent {
  final int cityId; // Car ID

  HomeFetchDataEvent({
    @required this.cityId,
  }) : assert(cityId != null);
}
