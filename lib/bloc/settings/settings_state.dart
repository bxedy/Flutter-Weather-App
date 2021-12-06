part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final TemperatureUnits temperatureUnits;

  SettingsState({this.temperatureUnits = TemperatureUnits.Celsius});

  @override
  List<Object?> get props => [temperatureUnits];
}
