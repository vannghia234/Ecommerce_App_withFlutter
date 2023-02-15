import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.black,
          ),
        ),
        const Expanded(
          flex: 2,
          child: SizedBox(),
        )
      ],
    );
  }
}
