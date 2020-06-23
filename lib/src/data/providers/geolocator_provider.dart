import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class GeolocatorApiClient {
  final Geolocator geolocator;

  GeolocatorApiClient({@required this.geolocator}) : assert(geolocator != null);

  getPosition() async {
    Position uPosition;

    uPosition = await geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) => position, onError: (e) {
      print(e);
    }).catchError((e) {
      print(e);
    });

    return uPosition;
  }

  getPlacemark(Position position) async {
    Placemark uPlacemark;

    uPlacemark = await geolocator
        .placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemark) => placemark.first)
        .catchError((e) {
      print(e);
    });

    return uPlacemark;
  }
}
