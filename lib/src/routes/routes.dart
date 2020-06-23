import 'package:get/get.dart';
import 'package:using_get/src/ui/android/home2_page.dart';
import 'package:using_get/src/ui/android/home_page.dart';
import 'package:using_get/src/ui/android/address_page.dart';

class MyRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => HomePage(),
    ),
    GetPage(
      name: '/second',
      page: () => Home2Page(),
    ),
    GetPage(
      name: '/third',
      page: () => AddressPage(),
    )
  ];
}
