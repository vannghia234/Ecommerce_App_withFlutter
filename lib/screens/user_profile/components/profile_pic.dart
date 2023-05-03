import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 115,
        width: 120,
        child: Stack(fit: StackFit.expand, children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/images/avt.png"),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: 46,
                width: 46,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: const Color(0xFFF5F6F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(color: Colors.white),
                        )),
                    child: SvgPicture.asset("assets/icons/Camera Icon.svg")),
              ))
        ]));
  }
}
