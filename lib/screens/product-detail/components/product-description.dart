import 'package:ecommerce_app/controller/favourite_controller.dart';
import 'package:ecommerce_app/screens/product-detail/components/rouded-container-desciption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../models/product_list_response.dart';
import 'expand-text-des.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.find<FavouriteController>();
    isSelected = widget.product.isFavourite!;
  }

  late bool isSelected;
  late FavouriteController controller;
  void changeStatus() {
    setState(() {
      isSelected = !isSelected;
      if (isSelected == false) {
        controller.removeProductFavourite(widget.product);
        widget.product.isFavourite = isSelected;
        return;
      }
      widget.product.isFavourite = isSelected;

      controller.addProductFavouriteList(widget.product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RoundedContainerDescription(
      color: Colors.white,
      widget: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '${widget.product.productName}',
            style: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 24, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            changeStatus();
          },
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 64,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40)),
                color: isSelected
                    ? const Color(0xffffe6e6)
                    : const Color.fromARGB(255, 225, 225, 226),
              ),
              child: SvgPicture.asset(
                'assets/icons/Heart Icon_2.svg',
                color: isSelected
                    ? const Color(0xffFF4848)
                    : const Color.fromARGB(255, 91, 91, 91),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ExpandTextDescription(product: widget.product),
        ),
      ]),
    );
  }
}
