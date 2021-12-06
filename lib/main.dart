import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app_v2/bloc/settings/settings_bloc.dart';
import 'package:weather_bloc_app_v2/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_bloc_app_v2/screens/insert_location_screen.dart';
import 'package:weather_bloc_app_v2/services/weather_repository.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => WeatherRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SettingsBloc(),
            ),
            BlocProvider(
              create: (context) => WeatherBloc(
                weatherRepo: context.read<WeatherRepository>(),
                settingsBloc: context.read<SettingsBloc>(),
              ),
            ),
          ],
          // SettingsBloc(),
          child: InsertLocationScreen(),
        ),
      ),
    );
  }
}
