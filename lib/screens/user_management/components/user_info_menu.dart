import 'package:ecommerce_app/configs/constant.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.text,
    required this.name,
  });
  final String text, name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Text(name),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        showSelectPhotoOptions(context);
      },
    );
  }
}

void showSelectPhotoOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.28,
        maxChildSize: 0.4,
        minChildSize: 0.28,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
              controller: scrollController,
              child: Container(
                color: kPrimaryColor,
              ));
        }),
  );
}
