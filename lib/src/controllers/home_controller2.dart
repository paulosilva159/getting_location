import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:using_get/src/data/repositories/locale_repository.dart';

class HomeController2 extends GetController {
  final LocaleRepository repository;
  HomeController2({@required this.repository}) : assert(repository != null);

  List countriesCode = [];
  List countriesName = [];
  String filterCode = '';
  String filterName = '';
  int currentIndex = 0;

  updateFilterCode(String value) {
    filterCode = value;
    update();
  }

  updateFilterName(String value) {
    filterName = value;
    update();
  }

  updateCurrentIndex(int value) {
    currentIndex = value;
    update();
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
