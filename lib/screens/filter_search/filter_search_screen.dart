import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/screens/filter_search/component/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterSearchScreen extends StatelessWidget {
  static String routeName = '/filter_search_screen';
  const FilterSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Body(),
      bottomNavigationBar: Container(
        height: 150,
        width: Get.width,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            height: 46,
            width: Get.width * 0.5,
            decoration: BoxDecoration(
                border: Border.all(color: kSecondaryColor.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(20)),
            child: const Center(
                child: Text(
              'Đặt lại',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
          ),
          Container(
            height: 46,
            width: Get.width * 0.5,
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(20)),
            child: const Center(
                child: Text(
              'Áp dụng',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
          )
        ]),
      ),
    );
  }
}
