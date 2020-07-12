/*
*   @file       home.dart
*   @project    Simple weather
*   @purpose    home view
*   @author     Athear Sky on 07/12/20
*   @copyright  Athear Sky
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_weather/constants/colors.dart';
import 'package:simple_weather/logics/home.dart';
import 'package:simple_weather/models/forecast.dart';
import 'package:simple_weather/widgets/loading.dart';
import 'package:simple_weather/widgets/retry.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  final HomeBloc _homeBloc = HomeBloc();
  Forecast _forecast;

  @override
  void initState() {
    // Fetch initial data
    _homeBloc.add(HomeFetchDataEvent(cityId: 1821306)); // Phnom Penh

    super.initState();
  }

  @override
  void dispose() {
    //  Close stream to prevent memory leak
    _homeBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        title: Text('Weather in Phnom Penh'),
      ),
      body: BlocProvider(
        create: (BuildContext conrtext) => _homeBloc,
        child: BlocListener(
          bloc: _homeBloc,
          listener: (BuildContext context, HomeState state) => _handleEvent(context, state),
          child: BlocBuilder(
            bloc: _homeBloc,
            builder: (BuildContext context, HomeState state) {
              return Loading(
                visible: state is HomeFetchingDataState,
                child: Retry(
                  visible: state is HomeInternetConnectionErrorState && state.notify && !state.showAlert,
                  onRetry: () {
                    _homeBloc.add(
                      HomeFetchDataEvent(cityId: 1821306),
                    );
                  },
                  child: _buildBody(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /*
  *   Build body
  *
  *   @return           Widget
  */
  Widget _buildBody() {
    if (_forecast == null) return Container();

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 150.0,
                    child: Text(
                      'Weather',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text('${_forecast.weather}'),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 150.0,
                    child: Text(
                      'Weather Desc',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text('${_forecast.weatherDescription}'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*
  *   Handle event
  *
  *   @param          context           BuildContext
  *   @param          state             HomeState
  *
  *   @return                           void
  */
  _handleEvent(BuildContext context, HomeState state) async {
    //  Case: error
    if (state is HomeErrorState) {
      //  Case: show alert
      if (state.notify && state.showAlert) {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(
                'Error',
              ),
              content: Center(
                child: Text('${state.message}'),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Ok',
                  ),
                ),
              ],
            );
          },
        );
      }
    }
    //  Case: fetch initial data successfully
    else if (state is HomeFetchedDataState) {
      _forecast = state.forecast;
    }
  }
}
