import 'package:ecommerce_app/screens/product-detail/components/rounded-iconBtn.dart';
import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({
    super.key,
  });

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int numofcount = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        RoundedIconBtn(
          icon: Icons.remove,
          press: () {},
        ),
        const SizedBox(
          width: 15,
        ),
        Text('x $numofcount'),
        const SizedBox(
          width: 15,
        ),
        RoundedIconBtn(
          icon: Icons.add,
          press: () {},
        ),
      ],
    );
  }
}
