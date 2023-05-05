import 'package:ecommerce_app/configs/size_config.dart';
import 'package:ecommerce_app/screens/product-detail/components/product-description.dart';
import 'package:ecommerce_app/screens/product-detail/components/rouded-container-desciption.dart';
import 'package:ecommerce_app/widget/default_button.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/screens/product-detail/components/product-images.dart';
import '../../../configs/constant.dart';
import '../../../models/product.dart';
import 'numofItem.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(
            product: product,
          ),
          Column(children: [
            ProductDescription(product: product),
            RoundedContainerDescription(
                color: kSecondaryColor.withOpacity(0.2),
                widget: Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: NumOfItemButton(),
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
                          text: 'Add to cart',
                          press: () {},
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
