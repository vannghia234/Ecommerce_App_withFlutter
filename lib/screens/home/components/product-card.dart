import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../configs/constant.dart';
import '../../../models/product.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.press,
  });
  final double width, aspectRatio;
  final GestureTapCallback press;
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: GestureDetector(
        onTap: widget.press,
        child: SizedBox(
          width: widget.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                  aspectRatio: widget.aspectRatio,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: kSecondaryColor.withOpacity(0.3), width: 0.2),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                        )
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          widget.product.images[0],
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.product.title,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${widget.product.price}",
                    style: const TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      setState(() {
                        // widget.product.isFavourite = !widget.product.isFavourite;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                          color: widget.product.isFavourite
                              ? kPrimaryColor.withOpacity(0.15)
                              : kSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        'assets/icons/Heart Icon_2.svg',
                        color: widget.product.isFavourite
                            ? const Color(0xffFF4848)
                            : const Color(0xffDBDEE4),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
