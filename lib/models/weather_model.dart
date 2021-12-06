class Weather {
  final String? assetPath;
  final String? description;
  final double? temp;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final String? city;
  final DateTime? lastUpdated;

  const Weather(
      {this.assetPath,
      this.description,
      this.temp,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity,
      this.city,
      this.lastUpdated});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        assetPath: _getAnimationPath(json["weather"][0]["main"]),
        description: json["weather"][0]["description"],
        temp: json["main"]["temp"],
        tempMin: json["main"]["temp_min"],
        tempMax: json["main"]["temp_max"],
        pressure: json["main"]["pressure"],
        humidity: json["main"]["humidity"],
        city: json["name"],
        lastUpdated: DateTime.now());
  }

  static final empty = Weather(
    assetPath: 'assets/animations/weather-windy.gif',
    description: 'unknown',
    temp: 0.0,
    tempMin: 0.0,
    tempMax: 0.0,
    pressure: 0,
    humidity: 0,
    city: 'unknown',
    lastUpdated: DateTime(0),
  );

  static String _getAnimationPath(String condition) {
    switch (condition) {
      case 'Thunderstorm':
        condition = 'assets/animations/weather-storm.gif';
        break;
      case 'Drizzle':
        condition = 'assets/animations/weather-partly-shower.gif';
        break;
      case 'Rain':
        condition = 'assets/animations/weather-partly-shower.gif';
        break;
      case 'Snow':
        condition = 'assets/animations/weather-snow.gif';
        break;
      case 'Mist':
        condition = 'assets/animations/weather-mist.gif';
        break;
      case 'Smoke':
        condition = 'assets/animations/weather-mist.gif';
        break;
      case 'Haze':
        condition = 'assets/animations/weather-mist.gif';
        break;
      case 'Fog':
        condition = 'assets/animations/foggy.gif';
        break;
      case 'Sand':
        condition = 'assets/animations/weather-mist.gif';
        break;
      case 'Dust':
        condition = 'assets/animations/weather-mist.gif';
        break;
      case 'Ash':
        condition = 'assets/animations/weather-mist.gif';
        break;
      case 'Squall':
        condition = 'assets/animations/weather-storm.gif';
        break;
      case 'Tornado':
        condition = 'assets/animations/weather-mist.gif';
        break;
      case 'Clear':
        condition = 'assets/animations/weather-sunny.gif';
        break;
      case 'Clouds':
        condition = 'assets/animations/foggy.gif';
        break;
      default:
        condition = 'assets/animations/weather-windy.gif';
    }
    return condition;
  }
}
