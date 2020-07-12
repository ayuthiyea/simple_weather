/*
*   @file       hone.dart
*   @project    Home service
*   @purpose    Home business logic
*   @author     Athear Sky on 07/12/20
*   @copyright  Athear Sky
*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:simple_weather/data/repositories/provider.dart';
import 'package:simple_weather/logics/events/home.dart';
import 'package:simple_weather/logics/states/home.dart';
import 'package:simple_weather/models/forecast.dart';
import 'package:simple_weather/utilities/parsed_response.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeInitializationState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    //  Case: fetch initial data
    if (event is HomeFetchDataEvent) {
      yield* _mapHomeFetchDataEventToStates(event);
    }
  }

  /*
  *   Map HomeFetchDataEvent to states
  *
  *   @param            event               HomeFetchDataEvent
  *
  *   @return                               Stream<HomeState>
  */
  Stream<HomeState> _mapHomeFetchDataEventToStates(HomeFetchDataEvent event) async* {
    yield HomeFetchingDataState();

    ParsedResponse<Forecast> parsedResponse = await Repository.weather.forecast(cityId: event.cityId);

    //  Case: Internet connection error
    if (parsedResponse.isNetworkConnectionError()) {
      yield HomeInternetConnectionErrorState(
        notify: true,
      );
    }
    //  Case: other error
    else if (parsedResponse.isError()) {
      yield HomeErrorState(
        message: 'Encounter error',
        notify: true,
        showAlert: true,
      );
    }
    //  Case: success
    else {
      yield HomeFetchedDataState(forecast: parsedResponse.result);
    }
  }
}
