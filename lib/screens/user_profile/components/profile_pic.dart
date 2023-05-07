import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 115,
        width: 120,
        child: Stack(fit: StackFit.expand, children: const [
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/images/avt.png"),
          ),
        ]));
  }
}
