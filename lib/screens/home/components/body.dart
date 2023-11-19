import 'package:ecommerce_app/screens/chat/chat-screen.dart';
import 'package:ecommerce_app/screens/home/components/popular-product.dart';
import 'package:ecommerce_app/screens/home/components/product_your_favourite.dart';
import 'package:ecommerce_app/screens/home/components/special-card.dart';
import 'package:ecommerce_app/screens/home/components/title-row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../api/chat/fetch_api_chat.dart';
import '../../../configs/size_config.dart';
import '../../../controller/login_account_info_controller.dart';
import '../../../controller/product_controller.dart';
import '../../../user_model.dart';
import '../../../widget/view_detail_all_byList.dart';
import 'cart-sale.dart';
import 'categories.dart';
import 'homeheader.dart';

class Body extends StatelessWidget {
  Body({super.key});
  final userController = Get.find<LoginAccountInfoController>();

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
            const CardSale(),
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
