import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:using_get/src/controllers/home_controller2.dart';
import 'package:using_get/src/data/providers/appwrite_provider.dart';
import 'package:using_get/src/data/repositories/locale_repository.dart';
import 'package:using_get/personal.dart';

class Home2Page extends StatelessWidget {
  static Client client = Client()
      .setEndpoint("https://$ip/v1")
      .setProject("$projectId")
      .setSelfSigned();

  final HomeController2 controller = Get.put(HomeController2(
      repository: LocaleRepository(
          apiClient:
              AppwriteApiClient(client: client, locale: Locale(client)))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Countries Code or Name')),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          TextField(
            onChanged: (value) {
              controller.currentIndex == 0
                  ? controller.updateFilterCode(value)
                  : controller.updateFilterName(value);

              controller.currentIndex == 0
                  ? controller.getCountriesCode()
                  : controller.getCountriesName();
            },
          ),
          Container(
            height: Get.height / 3,
            child: GetBuilder<HomeController2>(
                init: Get.find<HomeController2>(),
                builder: (_) {
                  return ListView.builder(
                    itemCount: _.currentIndex == 0
                        ? _.countriesCode.length
                        : _.countriesName.length,
                    itemBuilder: (context, index) {
                      return FlatButton(
                          onPressed: () {},
                          child: Text(
                              '${_.currentIndex == 0 ? _.countriesCode[index] : _.countriesName[index]}'));
                    },
                  );
                }),
          ),
          RaisedButton(
            onPressed: () {
              controller.update();
            },
            child: Text('update'),
          ),
          RaisedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('firstPage'),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<HomeController2>(
          init: Get.find<HomeController2>(),
          builder: (_) {
            return BottomNavigationBar(
              onTap: (value) {
                _.updateCurrentIndex(value);
              },
              currentIndex: _.currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('country code'),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.hotel), title: Text('country name')),
              ],
            );
          }),
    );
  }
}
