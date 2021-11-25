part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
  @override
  List<Object> get props => [];
}

class TemperatureUnitsChanged extends SettingsEvent {
  final String temperatureUnit;

  TemperatureUnitsChanged({required this.temperatureUnit});
  @override
  List<Object> get props => [temperatureUnit];
}
