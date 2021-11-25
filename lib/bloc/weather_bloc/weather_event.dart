part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class CitySubmitting extends WeatherEvent {
  final String city;

  const CitySubmitting({this.city = 'london'});

  @override
  List<Object> get props => [city];
}

class CitySubmitted extends WeatherEvent {}

class FetchWeatherByLocation extends WeatherEvent {}

class RefreshWeather extends WeatherEvent {
  final String city;

  RefreshWeather({required this.city});
}

class ResetWeather extends WeatherEvent {}
