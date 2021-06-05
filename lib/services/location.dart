import 'package:geolocator/geolocator.dart';

class Location {
  double _long, _lat;

  getLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      _lat = position.latitude;
      _long = position.longitude;
    } on Exception catch (e) {
      print(e);
    }
  }

  double getLongitude() {
    return _long;
  }

  double getLatitude() {
    return _lat;
  }
}
