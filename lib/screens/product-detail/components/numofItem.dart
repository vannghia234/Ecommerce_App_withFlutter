import 'package:ecommerce_app/screens/product-detail/components/rounded-iconBtn.dart';
import 'package:flutter/material.dart';

class NumOfItemButton extends StatefulWidget {
  const NumOfItemButton({
    super.key,
  });

  @override
  State<NumOfItemButton> createState() => _NumOfItemButtonState();
}

class _NumOfItemButtonState extends State<NumOfItemButton> {
  int numofcount = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        RoundedIconBtn(
          icon: Icons.remove,
          press: () {
            setState(() {
              if (numofcount == 1) {
                return;
              }
              numofcount--;
            });
          },
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
          press: () {
            setState(() {
              numofcount++;
            });
          },
        ),
      ],
    );
  }
}
