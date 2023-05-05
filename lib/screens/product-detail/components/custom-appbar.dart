import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.rating,
  });
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 15),
            child: CircleAvatar(
              backgroundColor: Color(0xffF5f6f9),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          decoration: BoxDecoration(
              color: const Color(0xffF5f6f9),
              borderRadius: BorderRadius.circular(14)),
          child: Row(children: [
            Text(
              rating,
              style: const TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.black),
            ),
            const SizedBox(
              width: 5,
            ),
            SvgPicture.asset('assets/icons/Star Icon.svg')
          ]),
        )
      ],
    );
  }
}
