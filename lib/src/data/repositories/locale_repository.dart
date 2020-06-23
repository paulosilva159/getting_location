import 'package:using_get/src/data/providers/appwrite_provider.dart';

class LocaleRepository {
  final AppwriteApiClient apiClient;

  LocaleRepository({this.apiClient});

  getCountriesCode(String filter) async {
    Map<String, dynamic> countries = await apiClient.getCountries();

    return filter != ''
        ? countries.keys
            .toList()
            .where((element) => element.contains(filter))
            .toList()
        : countries.keys.toList();
  }

  getCountriesName(String filter) async {
    Map<String, dynamic> countries = await apiClient.getCountries();

    return filter != ''
        ? countries.values
            .toList()
            .where((element) => element.contains(filter))
            .toList()
        : countries.values.toList();
  }
}
