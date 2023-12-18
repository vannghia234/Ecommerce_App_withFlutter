import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class itemButton extends StatelessWidget {
  const itemButton({
    super.key,
    required this.icon,
    required this.text,
  });
  final String icon, text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    boxShadow: const [
                      // BoxShadow(
                      //     color: Colors.black12,
                      //     blurRadius: 3,
                      //     offset: Offset(2, 6))
                    ],
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)),
                child: SvgPicture.asset(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
