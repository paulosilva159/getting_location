import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:using_get/src/controllers/home_controller.dart';
import 'package:using_get/src/data/providers/appwrite_provider.dart';
import 'package:using_get/src/data/repositories/locale_repository.dart';
import 'package:using_get/personal.dart';

class HomePage extends StatelessWidget {
  static Client client = Client()
      .setEndpoint("https://$ip/v1")
      .setProject("$projectId")
      .setSelfSigned();

  final HomeController controller = HomeController(
      repository: LocaleRepository(
          apiClient:
              AppwriteApiClient(client: client, locale: Locale(client))));

  @override
  Widget build(BuildContext context) {
    controller.getCountriesCode();
    controller.getCountriesName();

    return Scaffold(
      appBar: AppBar(title: Text('Countries Code or Name')),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          TextField(
            onChanged: (value) {
              controller.currentIndex == 0
                  ? controller.filterCode = value
                  : controller.filterName = value;

              controller.currentIndex == 0
                  ? controller.getCountriesCode()
                  : controller.getCountriesName();
            },
          ),
          Container(
            height: Get.height * 5 / 9,
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.currentIndex == 0
                    ? controller.countriesCode.length
                    : controller.countriesName.length,
                itemBuilder: (context, index) {
                  return FlatButton(
                      onPressed: () {},
                      child: Text(
                          '${controller.currentIndex == 0 ? controller.countriesCode[index] : controller.countriesName[index]}'));
                },
              );
            }),
          ),
          RaisedButton(
            onPressed: () {
              Get.toNamed('/second');
            },
            child: Text('secondPage'),
          ),
        ],
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: (value) {
            controller.currentIndex = value;
          },
          currentIndex: controller.currentIndex,
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
