import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<Position?> getCurrentLocation() async {
    try {
      final GeolocatorPlatform _geolocatorPlatform =
          GeolocatorPlatform.instance;
      Position position = await _geolocatorPlatform.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      return position;
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
