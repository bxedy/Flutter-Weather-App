import 'package:weather_bloc_app_v2/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Future<WeatherModel> getData(String url) async {
    http.Response response = await http.Client().get(Uri.parse((url)));
    if (response.statusCode == 200) {
      final jsonDecoded = jsonDecode(response.body);
      print(jsonDecoded);
      return WeatherModel.fromJson(jsonDecoded);
    } else {
      throw Exception('Something went wrong');
    }
  }
}
