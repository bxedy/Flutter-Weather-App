import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

enum TemperatureUnits { Fahrenheit, Celsius }

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState());

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is TemperatureUnitsChanged) {
      if (event.temperatureUnit == TemperatureUnits.Celsius) {
        yield SettingsState(temperatureUnits: TemperatureUnits.Celsius);
      } else if (event.temperatureUnit == TemperatureUnits.Fahrenheit) {
        yield SettingsState(temperatureUnits: TemperatureUnits.Fahrenheit);
      }
    }
  }
}
