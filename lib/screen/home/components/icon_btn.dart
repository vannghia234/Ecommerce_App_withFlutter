import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    super.key,
    required this.svgSrc,
    this.numOfItems = 0,
    required this.press,
  });
  final String svgSrc;
  final int numOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            height: 46,
            width: 46,
            decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                shape: BoxShape.circle),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numOfItems != 0)
            Positioned(
              right: 0,
              top: -3,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                    color: const Color(0xffff4848),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5)),
                child: Center(
                  child: Text(
                    '$numOfItems',
                    style: const TextStyle(
                        color: Colors.white, fontSize: 10, height: 1),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
