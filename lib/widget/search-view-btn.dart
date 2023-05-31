import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/widget/result-search.dart';
import 'package:ecommerce_app/widget/show_loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../controller/product_controller.dart';

class SearchViewButton extends StatelessWidget {
  static String routeName = '/searchview';
  const SearchViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final focusNode = FocusNode();
    final controller1 = Get.find<ProductController>();

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          ShowUpAnimation(
            delayStart: const Duration(milliseconds: 200),
            animationDuration: const Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
            direction: Direction.vertical,
            offset: -0.5,
            child: TextField(
              autocorrect: true,
              controller: controller,
              focusNode: focusNode,
              autofocus: true,
              onEditingComplete: () async {
                showLoadingAnimation(context);
                await controller1.searchProductName(controller.text);
                Get.back();
                Get.toNamed(ResultSearchScreen.routeName,
                    arguments: controller.text);
              },
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 12, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        focusNode.unfocus();
                        Get.back();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: kSecondaryColor),
                      ),
                    ),
                  ),
                  hintText: 'Search Product',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none),
            ),
          ),
          const Divider(
            thickness: 1.5,
          )
        ]),
      ),
    );
  }
}
