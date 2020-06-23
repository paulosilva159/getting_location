import 'package:appwrite/appwrite.dart';
import 'package:meta/meta.dart';

class AppwriteApiClient {
  final Client client;
  final Locale locale;
  final Database database;

  AppwriteApiClient({this.database, this.locale, @required this.client})
      : assert(client != null);

  getCountries() async {
    Map<String, dynamic> data;

    data =
        await locale.getCountries().then((value) => value.data).catchError((e) {
      print(e);
    });

    return data;
  }
}
