import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../../configs/constant.dart';
import '../../../models/product.dart';

class ProductCardItem extends StatefulWidget {
  const ProductCardItem({
    super.key,
    required this.product,
    required this.press,
  });
  final Product product;
  final GestureTapCallback press;

  @override
  State<ProductCardItem> createState() => _ProductCardItemState();
}

class _ProductCardItemState extends State<ProductCardItem> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              SizedBox(
                width: 150,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: kSecondaryColor.withOpacity(0.3))),
                    child: Image.asset(
                      widget.product.images.first,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 3,
                right: 3,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selected = !_selected;
                    });
                  },
                  child: Container(
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: kSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        'assets/icons/Heart Icon_2.svg',
                        color: _selected
                            ? const Color(0xffFF4848)
                            : const Color(0xffDBDEE4),
                      )),
                ),
              )
            ],
          ),
          Text(
            widget.product.title,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Row(
            children: [
              Text(
                widget.product.rating.toString(),
                style: const TextStyle(fontSize: 13),
              ),
              RatingBar.builder(
                ignoreGestures: true,
                itemSize: 14,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                initialRating: widget.product.rating,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                onRatingUpdate: (value) {},
              )
            ],
          ),
          Text(
            '₫${widget.product.price.toString()}',
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
