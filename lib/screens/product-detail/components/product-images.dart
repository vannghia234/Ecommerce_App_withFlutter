import 'package:flutter/material.dart';

import '../../../configs/constant.dart';
import '../../../models/product.dart';
import 'custom-appbar.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({super.key, required this.product});
  final Product product;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        CustomAppbar(
          rating: widget.product.rating.toString(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(widget.product.images[selectedImage])),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.images.length,
                (index) => buildSmallPreview(index))
          ],
        ),
        const Divider()
      ],
    );
  }

  buildSmallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: selectedImage == index
                    ? kPrimaryColor
                    : kSecondaryColor.withOpacity(0.1),
                width: 1.5)),
        child: Image.asset(
          widget.product.images[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
