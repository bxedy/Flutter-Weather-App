import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app_v2/bloc/settings/settings_bloc.dart';
import 'package:weather_bloc_app_v2/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_bloc_app_v2/screens/settings_screen.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _AppBar(),
      body: SafeArea(
          child: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state.isInitial) {
            SchedulerBinding.instance!.addPostFrameCallback((_) {
              Navigator.pop(context);
            });
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
            displacement: 0,
            color: Colors.blueGrey.shade900,
            onRefresh: () async {
              context.read<WeatherBloc>().add(RefreshWeather());
            },
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _cityText(
                      city: state.weather.city!,
                    ),
                    _descriptionText(
                      description: state.weather.description!,
                    ),
                    _weatherAnimationWidget(
                      path: state.weather.assetPath!,
                    ),
                    _temperatureRow(
                        tempMin: state.weather.tempMin!,
                        temp: state.weather.temp!,
                        tempMax: state.weather.tempMax!),
                    _humidityRow(
                      humidity: state.weather.humidity!,
                    ),
                    _pressureRow(
                      pressure: state.weather.pressure!,
                    ),
                    _lastUpdateRow(
                      context: context,
                      lastUpdate: state.weather.lastUpdated!,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      )),
    );
  }

  Widget _descriptionText({required String description}) {
    return Text(
      '$description',
      style: TextStyle(
          color: Colors.blueGrey.shade400,
          fontWeight: FontWeight.w700,
          fontSize: 17),
    );
  }

  Widget _cityText({required String city}) {
    return Text(
      '$city',
      style: TextStyle(
        color: Colors.blueGrey.shade800,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  Widget _weatherAnimationWidget({required String path}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 120.0),
      child: Container(
        width: 200,
        height: 200,
        child: Image.asset(path),
      ),
    );
  }

  Widget _temperatureRow(
      {required double tempMin,
      required double temp,
      required double tempMax}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Temperature:',
            style: TextStyle(
                color: Colors.blueGrey.shade700,
                fontWeight: FontWeight.w700,
                fontSize: 17),
          ),
          Row(
            children: [
              Text(
                '${tempMin.toStringAsFixed(0)}° / ',
                style: TextStyle(
                    color: Colors.blueGrey.shade500,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '${temp.toStringAsFixed(0)}°',
                style: TextStyle(
                    color: Colors.blueGrey.shade700,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                ' / ${tempMax.toStringAsFixed(0)}°',
                style: TextStyle(
                    color: Colors.blueGrey.shade500,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _humidityRow({required int humidity}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Humidity:',
            style: TextStyle(
                color: Colors.blueGrey.shade700,
                fontWeight: FontWeight.w700,
                fontSize: 17),
          ),
          Text(
            '$humidity %',
            style: TextStyle(
                color: Colors.blueGrey.shade700,
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _pressureRow({required int pressure}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Pressure:',
            style: TextStyle(
                color: Colors.blueGrey.shade700,
                fontWeight: FontWeight.w700,
                fontSize: 17),
          ),
          Text(
            '$pressure',
            style: TextStyle(
                color: Colors.blueGrey.shade700,
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _lastUpdateRow(
      {required BuildContext context, required DateTime lastUpdate}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Last update at:',
            style: TextStyle(
                color: Colors.blueGrey.shade700,
                fontWeight: FontWeight.w700,
                fontSize: 17),
          ),
          Text(
            '${TimeOfDay.fromDateTime(lastUpdate).format(context)}',
            style: TextStyle(
                color: Colors.blueGrey.shade700,
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(preferredSize.height),
      child: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        return AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.blueGrey.shade900,
              ),
              onPressed: () {
                SchedulerBinding.instance!.addPostFrameCallback((_) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                              value: context.read<SettingsBloc>(),
                              child: SettingsScreen())));
                });
              },
            ),
          ],
          leading: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.blueGrey.shade900,
            ),
            onPressed: () {
              context.read<WeatherBloc>().add(ResetWeather());
            },
          ),
        );
      }),
    );
  }
}
