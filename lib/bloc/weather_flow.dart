// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_bloc_app/services/weather_repository.dart';
//
// enum Weather { weatherLoaded, weatherEmpty }
//
// class WeatherFlow extends Cubit<Weather> {
//   final WeatherRepository weatherRepository;
//
//   WeatherFlow(this.weatherRepository) : super(Weather.weatherEmpty);
//
//   void showWeather({required WeatherRepository weatherRepo}) =>
//       emit(Weather.weatherLoaded);
//   void showCity() => emit(Weather.weatherEmpty);
// }
