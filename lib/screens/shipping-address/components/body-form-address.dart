import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/widget/default_button.dart';
import 'package:flutter/material.dart';

class BodyFormAddress extends StatefulWidget {
  const BodyFormAddress({super.key});

  @override
  State<BodyFormAddress> createState() => _BodyFormAddressState();
}

class _BodyFormAddressState extends State<BodyFormAddress> {
  bool turnOnSwitch = true;
  final globalKeyAdress = GlobalKey<FormState>();
  final MaterialStateProperty<Color?> trackColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      // Track color when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return Colors.amber;
      }
      // Otherwise return null to set default track color
      // for remaining states such as when the switch is
      // hovered, focused, or disabled.
      return null;
    },
  );
  final MaterialStateProperty<Color?> overlayColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      // Material color when switch is selected.
      if (states.contains(MaterialState.selected)) {
        return kPrimaryColor;
      }
      // Material color when switch is disabled.
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey.shade400;
      }
      // Otherwise return null to set default material color
      // for remaining states such as when the switch is
      // hovered, or focused.
      return null;
    },
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Form(
              key: globalKeyAdress,
              child: SizedBox(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Họ tên', labelText: 'Họ tên'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Số điện thoại', labelText: 'SĐT'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Địa chỉ', labelText: 'Địa chỉ'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      color: Colors.grey,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Đặt mặc định',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Switch(
                          thumbColor: const MaterialStatePropertyAll<Color>(
                              Colors.black),
                          overlayColor: overlayColor,
                          trackColor: trackColor,
                          value: turnOnSwitch,
                          onChanged: (value) {
                            setState(() {
                              turnOnSwitch = !turnOnSwitch;
                            });
                          },
                        )
                      ],
                    ),
                    // const Spacer(),
                  ],
                ),
              )),
          const Spacer(),
          DefaultButton(
            text: 'Lưu địa chỉ',
            press: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    ));
  }
}
