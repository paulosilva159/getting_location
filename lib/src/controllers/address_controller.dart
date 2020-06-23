import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:using_get/src/data/repositories/locale_repository.dart';

class AddressController extends RxController {
  final LocaleRepository repository;
  AddressController({@required this.repository}) : assert(repository != null);

  final _address = ''.obs;
  String get address => this._address.value;
  set address(String value) => this._address.value = value;

  getAddress() async {
    address = await repository.getAddress();
  }
}
