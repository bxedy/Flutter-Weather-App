import 'package:weather_bloc_app_v2/helpers/network.dart';
import 'package:weather_bloc_app_v2/models/weather_model.dart';

class WeatherRepository {
  Future<Weather> getWeatherByCity(
      {required String city, required String temperatureUnit}) async {
    NetworkHelper networkHelper = NetworkHelper();
    var weatherData = await networkHelper.getData(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&units=$temperatureUnit&appid=5e366e99c4c1cc75627f847e758073c6');
    return weatherData;
  }

  Future<Weather?> getWeatherByLocation(
      {required double latitude,
      required double longitude,
      required String temperatureUnit}) async {
    try {
      NetworkHelper networkHelper = NetworkHelper();
      var weatherData = await networkHelper.getData(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=$temperatureUnit&appid=5e366e99c4c1cc75627f847e758073c6');
      return weatherData;
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
