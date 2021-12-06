part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeatherByCity extends WeatherEvent {
  final String city;

  const FetchWeatherByCity({required this.city});

  @override
  List<Object> get props => [city];
}

class FetchWeatherByLocation extends WeatherEvent {}

class RefreshWeather extends WeatherEvent {}

class ResetWeather extends WeatherEvent {}
