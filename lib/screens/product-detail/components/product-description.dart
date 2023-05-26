import 'package:ecommerce_app/screens/product-detail/components/rouded-container-desciption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/product_list_response.dart';
import 'expand-text-des.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return RoundedContainerDescription(
      color: Colors.white,
      widget: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '${product.productName}',
            style: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 24, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 64,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40)),
              color: product.isFavourite!
                  ? const Color(0xffffe6e6)
                  : const Color.fromARGB(255, 225, 225, 226),
            ),
            child: SvgPicture.asset(
              'assets/icons/Heart Icon_2.svg',
              color: const Color(0xffff4848),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ExpandTextDescription(product: product),
        ),
      ]),
    );
  }
}
