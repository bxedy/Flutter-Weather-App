import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/bloc/settings/settings_bloc.dart';
import 'package:weather_bloc_app/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_bloc_app/screens/location_screen.dart';
import 'package:weather_bloc_app/screens/weather_screen.dart';
import 'package:weather_bloc_app/services/weather_repository.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SettingsBloc(),
        ),
        BlocProvider(
          create: (context) => WeatherBloc(
            settingsBloc: context.read<SettingsBloc>(),
            weatherRepo: context.read<WeatherRepository>(),
          ),
        ),
      ],
      child: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        return Navigator(
          pages: [
            if (state is WeatherEmpty)
              MaterialPage(
                child: LocationScreen(),
              ),
            if (state is WeatherLoaded)
              MaterialPage(
                child: WeatherScreen(),
              ),
          ],
          onPopPage: (route, result) => route.didPop(result),
        );
      }),
    );
  }
}
