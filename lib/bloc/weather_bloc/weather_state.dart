part of 'weather_bloc.dart';

enum WeatherStatus { initial, loading, success, failure }

class WeatherState extends Equatable {
  final WeatherStatus weatherStatus;
  final Weather weather;

  WeatherState({
    this.weatherStatus = WeatherStatus.initial,
    Weather? weather,
  }) : weather = weather ?? Weather.empty;

  WeatherState copyWith({
    WeatherStatus? weatherStatus,
    Weather? weather,
  }) {
    return WeatherState(
      weatherStatus: weatherStatus ?? this.weatherStatus,
      weather: weather ?? this.weather,
    );
  }

  bool get isInitial => weatherStatus == WeatherStatus.initial;
  bool get isLoading => weatherStatus == WeatherStatus.loading;
  bool get isSuccess => weatherStatus == WeatherStatus.success;
  bool get isFailure => weatherStatus == WeatherStatus.failure;

  @override
  List<Object?> get props => [weatherStatus, weather];
}
