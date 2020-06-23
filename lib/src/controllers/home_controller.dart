import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:using_get/src/data/repositories/locale_repository.dart';

class HomeController extends RxController {
  final LocaleRepository repository;
  HomeController({@required this.repository}) : assert(repository != null);

  final _countriesCode = List<String>().obs;
  List<String> get countriesCode => this._countriesCode.value;
  set countriesCode(List<String> value) => this._countriesCode.value = value;

  final _countriesName = List<dynamic>().obs;
  List<dynamic> get countriesName => this._countriesName.value;
  set countriesName(List<dynamic> value) => this._countriesName.value = value;

  final _filterCode = ''.obs;
  get filterCode => this._filterCode.value;
  set filterCode(value) => this._filterCode.value = value;

  final _filterName = ''.obs;
  get filterName => this._filterName.value;
  set filterName(value) => this._filterName.value = value;

  final _currentIndex = 0.obs;
  int get currentIndex => this._currentIndex.value;
  set currentIndex(int value) => this._currentIndex.value = value;

  getCountriesCode() async {
    countriesCode = await repository.getCountriesCode(filterCode);
  }

  getCountriesName() async {
    countriesName = await repository.getCountriesName(filterName);
  }
}
