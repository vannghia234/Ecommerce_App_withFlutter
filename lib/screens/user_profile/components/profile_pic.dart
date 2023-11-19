import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
    required this.url,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 115,
        width: 120,
        child: Stack(fit: StackFit.expand, children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 99, 88, 88),
            backgroundImage: NetworkImage(url),
          ),
        ]));
  }
}
