import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:using_get/src/data/repositories/locale_repository.dart';

class Home2Controller extends GetController {
  final LocaleRepository repository;
  Home2Controller({@required this.repository}) : assert(repository != null);

  List countriesCode = [];
  List countriesName = [];
  String filterCode = '-1';
  String filterName = '-1';
  int currentIndex = 0;

  updateFilterCode(String value) {
    filterCode = value;
  }

  updateFilterName(String value) {
    filterName = value;
  }

  updateCurrentIndex(int value) {
    currentIndex = value;
  }

  getCountriesCode() async {
    countriesCode = await repository.getCountriesCode(filterCode);
    // update();
  }

  getCountriesName() async {
    countriesName = await repository.getCountriesName(filterName);
    // update();
  }
}
