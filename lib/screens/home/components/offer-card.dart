import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required this.category,
    required this.image,
    required this.numOfBrand,
    required this.press,
  });
  final String category, image;
  final int numOfBrand;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: 245,
          height: 100,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.black26,
                  Colors.black12,
                  // const Color(0xFF343434).withOpacity(0.4),
                  // const Color(0xFF343434).withOpacity(0.15),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "$category\n",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  TextSpan(text: "+$numOfBrand thương hiệu")
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
