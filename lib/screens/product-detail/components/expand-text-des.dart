import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../../configs/constant.dart';
import '../../../models/product_list_response.dart';

class ExpandTextDescription extends StatefulWidget {
  const ExpandTextDescription({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ExpandTextDescription> createState() => _ExpandTextDescriptionState();
}

class _ExpandTextDescriptionState extends State<ExpandTextDescription> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      widget.product.description!,
      animationCurve: Curves.easeInOut,
      animation: true,
      animationDuration: kAnimationDuration,
      expandText: 'Xem chi tiết',
      collapseText: 'Thu gọn',
      linkStyle: const TextStyle(fontWeight: FontWeight.w600),
      maxLines: 3,
      linkColor: kPrimaryColor,
      expanded: isExpanded,
      onExpandedChanged: (value) {
        setState(() {
          isExpanded = value;
        });
      },
    );
  }
}
