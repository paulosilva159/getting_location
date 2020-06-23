import 'package:geolocator/geolocator.dart';
import 'package:using_get/src/data/providers/appwrite_provider.dart';
import 'package:using_get/src/data/providers/geolocator_provider.dart';

class LocaleRepository {
  final AppwriteApiClient appwriteApiClient;
  final GeolocatorApiClient geolocatorApiClient;

  LocaleRepository({this.geolocatorApiClient, this.appwriteApiClient});

  getCountriesCode(String filter) async {
    Map<String, dynamic> countries = await appwriteApiClient.getCountries();

    return filter != '-1'
        ? countries.keys
            .toList()
            .where((element) => element.contains(filter))
            .toList()
        : countries.keys.toList();
  }

  getCountriesName(String filter) async {
    Map<String, dynamic> countries = await appwriteApiClient.getCountries();

    return filter != '-1'
        ? countries.values
            .toList()
            .where((element) => element.contains(filter))
            .toList()
        : countries.values.toList();
  }

  getAddress() async {
    Placemark placemark;

    placemark = await geolocatorApiClient
        .getPlacemark(await geolocatorApiClient.getPosition());

    return placemark != Placemark()
        ? '${placemark.subAdministrativeArea ?? placemark.locality}, '
            '${placemark.administrativeArea}'
        : '';
  }
}
