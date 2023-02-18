import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSuffix extends StatelessWidget {
  const CustomSuffix({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, bottom: 20),
      child: SvgPicture.asset(svgIcon, height: 18),
    );
  }
}
