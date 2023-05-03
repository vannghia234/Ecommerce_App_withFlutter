import 'package:flutter/material.dart';

class RoundedContainerDescription extends StatelessWidget {
  const RoundedContainerDescription({
    super.key,
    required this.color,
    required this.widget,
  });
  final Color color;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: widget,
    );
  }
}
