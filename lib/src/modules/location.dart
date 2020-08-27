import 'package:geolocator/geolocator.dart';

class PlaceLocation {
  Future getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
