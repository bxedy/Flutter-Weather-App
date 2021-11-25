import 'package:flutter/material.dart';
import 'package:weather_bloc_app_v2/screens/settings_screen.dart';
import 'package:weather_bloc_app_v2/screens/weather_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherScreen(),
    );
  }
}
