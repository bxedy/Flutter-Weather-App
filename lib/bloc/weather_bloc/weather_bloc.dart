import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/bloc/settings/settings_bloc.dart';
import 'package:weather_bloc_app/helpers/location.dart';
import 'package:weather_bloc_app/models/weather_model.dart';
import 'package:weather_bloc_app/services/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepo;
  final SettingsBloc settingsBloc;

  WeatherBloc({required this.weatherRepo, required this.settingsBloc})
      : super(WeatherEmpty());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is CitySubmitted) {
      yield* _mapFetchWeatherByCityToState(event);
    } else if (event is FetchWeatherByLocation) {
      yield* _mapFetchWeatherByLocationToState();
    }
  }

  Stream<WeatherState> _mapFetchWeatherByCityToState(event) async* {
    yield WeatherIsLoading();
    try {
      final WeatherModel weather = await weatherRepo.getWeatherByCity(
          city: event.city,
          temperatureUnit: settingsBloc.state.temperatureUnit);
      yield WeatherLoaded(weather: weather);
    } on Exception catch (e) {
      WeatherError(e);
    }
  }

  Stream<WeatherState> _mapFetchWeatherByLocationToState() async* {
    yield WeatherIsLoading();
    try {
      final position = await Location().getCurrentLocation();
      if (position != null) {
        final WeatherModel? weather = await weatherRepo.getWeatherByLocation(
            latitude: position.latitude,
            longitude: position.longitude,
            temperatureUnit: settingsBloc.state.temperatureUnit);
        yield WeatherLoaded(weather: weather!);
      }
    } on Exception catch (e) {
      WeatherError(e);
    }
  }

  Stream<WeatherState> _mapRefreshWeatherToState(event) async* {
    try {
      final WeatherModel weather = await weatherRepo.getWeatherByCity(
          city: event.city,
          temperatureUnit: settingsBloc.state.temperatureUnit);
      yield WeatherLoaded(weather: weather);
    } on Exception catch (e) {
      WeatherError(e);
    }
  }
}
