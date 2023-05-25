import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 115,
        width: 120,
        child: Stack(fit: StackFit.expand, children: [
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 99, 88, 88),
            backgroundImage: AssetImage("assets/images/avt.png"),
          ),
        ]));
  }
}
