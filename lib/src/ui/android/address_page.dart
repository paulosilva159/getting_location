import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:using_get/src/controllers/address_controller.dart';
import 'package:using_get/src/data/providers/geolocator_provider.dart';
import 'package:using_get/src/data/repositories/locale_repository.dart';

class AddressPage extends StatelessWidget {
//repository injection
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
      ),
      body: ListView(children: [
        Container(
          height: Get.height * 3 / 4,
          child: GetX<AddressController>(
            init: AddressController(
                repository: LocaleRepository(
                    geolocatorApiClient: GeolocatorApiClient(
                        geolocator: Geolocator()
                          ..forceAndroidLocationManager))),
            initState: (state) {
              Get.find<AddressController>().getAddress();
            },
            builder: (_) {
              return FlatButton(
                  onPressed: () {
                    _.getAddress();
                  },
                  child: Text('Endereço: ${_.address}'));
            },
          ),
        ),
        RaisedButton(
          onPressed: () {
            Get.back();
          },
          child: Text('go back'),
        )
      ]),
    );
  }
}
