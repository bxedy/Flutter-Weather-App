part of 'settings_bloc.dart';

// enum TemperatureUnits {
//   imperial,
//   //Fahrenheit
//   metric
//   //Celsius
// }

class SettingsState {
  final String temperatureUnit;

  // final TemperatureUnits temperatureUnits;
  //
  // SettingsState({required this.temperatureUnits});
  //
  // @override
  // List<Object?> get props => [temperatureUnits];
  SettingsState({
    this.temperatureUnit = 'metric',
  });

  SettingsState copyWith({
    String? temperatureUnit,
  }) {
    return SettingsState(
      temperatureUnit: temperatureUnit ?? this.temperatureUnit,
    );
  }
}
