part of 'weather_bloc.dart';

abstract class WeatherState {}

class WeatherEmpty extends WeatherState {}

class WeatherIsSubmitting extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weather;

  WeatherLoaded({required this.weather});
}

class WeatherError extends WeatherState {
  final Exception exception;

  WeatherError(this.exception);
}
