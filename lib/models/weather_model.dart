class WeatherModel {
  final dynamic main;
  final dynamic condition;
  final dynamic temp;
  final dynamic tempMin;
  final dynamic tempMax;
  final dynamic pressure;
  final dynamic humidity;
  final dynamic city;
  final DateTime lastUpdated;

  WeatherModel(
      {this.main,
      this.condition,
      this.temp,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity,
      this.city,
      required this.lastUpdated});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        main: json["main"],
        condition: json["weather"][0]["description"],
        temp: json["main"]["temp"],
        tempMin: json["main"]["temp_min"],
        tempMax: json["main"]["temp_max"],
        pressure: json["main"]["pressure"],
        humidity: json["main"]["humidity"],
        city: json["name"],
        lastUpdated: DateTime.now());
  }
}
