import 'package:ecommerce_app/configs/size_config.dart';
import 'package:ecommerce_app/controller/get_cart_user_controller.dart';
import 'package:ecommerce_app/root.dart';
import 'package:ecommerce_app/screens/product-detail/components/product-description.dart';
import 'package:ecommerce_app/screens/product-detail/components/rouded-container-desciption.dart';
import 'package:ecommerce_app/screens/product-detail/components/rounded-iconBtn.dart';
import 'package:ecommerce_app/widget/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/carts/push_api.dart';
import '../../../configs/constant.dart';
import '../../../models/product_list_response.dart';
import 'product-images.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.product});
  final Product product;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final controller = Get.find<GetCartUserController>();
  var numOfItem = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: widget.product),
          Column(children: [
            ProductDescription(product: widget.product),
            RoundedContainerDescription(
                color: kSecondaryColor.withOpacity(0.2),
                widget: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          const Spacer(),
                          RoundedIconBtn(
                            icon: Icons.remove,
                            press: () {
                              if (numOfItem == 1) {
                                return;
                              }
                              setState(() {
                                numOfItem--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'x $numOfItem',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          RoundedIconBtn(
                            icon: Icons.add,
                            press: () {
                              setState(() {
                                numOfItem++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    RoundedContainerDescription(
                      color: Colors.white,
                      widget: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            top: 15,
                            bottom: 40,
                            right: SizeConfig.screenWidth * 0.15),
                        child: DefaultButton(
                          text: 'Thêm vào giỏ hàng',
                          press: () {
                            try {
                              // showLoadingAnimation(context);
                              PushApiCartService.instance.addToCart(
                                  productId: widget.product.productId!,
                                  quantity: numOfItem.toString());
                              // LoginAccountInfoController info =
                              //     Get.find<LoginAccountInfoController>();
                              // await controller.getCartUser(info.user!.id!);
                              controller.totalCartItem++;
                              Get.offNamed(RootApp.routeName);
                            } catch (e) {
                              throw Exception(e);
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ))
          ])
        ],
      ),
    ));
  }
}
