import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/screens/chat/chat-screen.dart';
import 'package:ecommerce_app/screens/home/components/popular-product.dart';
import 'package:ecommerce_app/screens/home/components/product_your_favourite.dart';
import 'package:ecommerce_app/screens/home/components/special-card.dart';
import 'package:ecommerce_app/screens/home/components/title-row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../api/chat/fetch_api_chat.dart';
import '../../../configs/size_config.dart';
import '../../../controller/login_account_info_controller.dart';
import '../../../controller/product_controller.dart';
import '../../../user_model.dart';
import '../../../widget/view_detail_all_byList.dart';
import 'categories.dart';
import 'homeheader.dart';

class Body extends StatelessWidget {
  Body({super.key});
  final userController = Get.find<LoginAccountInfoController>();

  List slider_image = [
    "assets/images/wPBKf1KF3VAuZHdWR5p4IAuBgcd2Zw2HgMhsPajO.svg",
    "assets/images/KYir9GxjHc8lJWZAGbkfl066XyqXcaeJN8Feu31E.svg",
    "assets/images/a94DpbP8oGz5cr8dP45YynC5AyrPqoXUNLjqYzMN.svg"
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.03,
            ),
            const HomeHeader(),
            SizedBox(
              height: SizeConfig.screenHeight * 0.03,
            ),
            // const CardSale(),
            SliderWidget(slider_image: slider_image),

            SizedBox(
              height: SizeConfig.screenHeight * 0.03,
            ),
            const Categories(),
            SizedBox(
              height: SizeConfig.screenHeight * 0.03,
            ),
            TitleRow(
              title: 'Tin tức',
              subTitle: 'Xem thêm',
              press: () async {
                final response = await FetchApiChatService.instance
                    .getMessage(userController.user.id ?? "", "1", "10");
                final message = response?.data?.toList();
                List<ChatModel> resultMessage = List.empty();
                Logger().i("Chat list size" "${message?.length}");
                for (ChatModel chatItem in message ?? List.empty()) {
                  ChatModel chat = ChatModel(
                      id: chatItem.id,
                      message: chatItem.message,
                      userReceive: chatItem.userReceive,
                      userSend: chatItem.userSend);
                  resultMessage.add(chat);
                }
                Get.to(() => ChatPage(
                      listChat: resultMessage,
                    ));
              },
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            const SpecialCard(),
            SizedBox(
              height: SizeConfig.screenHeight * 0.05,
            ),
            TitleRow(
              title: 'Sản phẩm phổ biến',
              subTitle: 'Xem thêm',
              press: () {
                Get.to(
                    () => ViewDetailAllByList(
                          title: 'Sản phẩm phổ biến',
                          productLists: controller.listAllProduct,
                        ),
                    transition: Transition.fadeIn);
              },
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            const PopularProduct(),
            SizedBox(
              height: SizeConfig.screenHeight * 0.05,
            ),
            TitleRow(
              title: 'Có thể bạn thích',
              subTitle: 'Xem thêm',
              press: () {
                Get.to(
                    () => ViewDetailAllByList(
                          title: 'Có thể bạn thích',
                          productLists: controller.listAllProduct,
                        ),
                    transition: Transition.fadeIn);
              },
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            const ProductYourFavourite(),
          ],
        ),
      ),
    ));
  }
}

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.slider_image,
  });

  final List slider_image;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 220,
        // aspectRatio: 16 / 9,
        viewportFraction: 0.95,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: (index, reason) {},
        scrollDirection: Axis.horizontal,
      ),
      itemCount: slider_image.length,
      itemBuilder:
          (BuildContext context, int itemIndex, int pageViewIndex) =>
              ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 350,
          width: 800,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 27,
                spreadRadius: 7,
                color: Colors.black54,
                offset: Offset(4, -9)),
            // BoxShadow(
            //     blurRadius: 19,
            //     spreadRadius: 7,
            //     color: Colors.black38,
            //     offset: Offset(4, -9))
          ]),
          child: SizedBox(
            child: SvgPicture.asset(
              slider_image[itemIndex],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
