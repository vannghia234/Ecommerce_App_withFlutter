// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/screens/shipping-address/form-address.dart';
import 'package:ecommerce_app/widget/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressInfomation {
  final String name;
  final String address;
  final String sdt;
  AddressInfomation({
    required this.name,
    required this.address,
    required this.sdt,
  });
}

class BodyShippingAdress extends StatefulWidget {
  const BodyShippingAdress({super.key});

  @override
  State<BodyShippingAdress> createState() => _BodyShippingAdressState();
}

class _BodyShippingAdressState extends State<BodyShippingAdress> {
  int focus = 1;
  List<AddressInfomation> lists = [
    AddressInfomation(
        address: '444 Xã Suối Kiết, Huyện Tánh Linh, Tỉnh Bình Thuận',
        name: "Nguyễn Văn Nghĩa",
        sdt: '033934933'),
    AddressInfomation(
        address: '23 Xã Suối Kiết, Huyện Tánh Linh, Tỉnh Bình Thuận',
        name: "Vũ Trọng Nghĩa",
        sdt: '093934933'),
    AddressInfomation(
        address: '22 Xã Suối Kiết, Huyện Tánh Linh, Tỉnh Bình Thuận',
        name: "Trịnh Xuân Nghĩa",
        sdt: '0334920242')
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SafeArea(
        child: Column(
          children: [
            ...List.generate(
                lists.length,
                (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          focus = index;
                        });
                      },
                      child: AddressInfo(
                        address: lists[index].address,
                        name: lists[index].name,
                        isSelected: focus == index,
                        sdt: lists[index].sdt,
                      ),
                    )),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.to(const FormAddress());
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14)),
                child: const Column(children: [
                  Icon(Icons.add),
                  Text(
                    'Thêm địa chỉ mới',
                    style: TextStyle(fontSize: 19),
                  )
                ]),
              ),
            ),
            const Spacer(),
            DefaultButton(
              text: 'Tiếp Tục',
              press: () {
                Get.to(const FormAddress());
              },
            )
          ],
        ),
      ),
    );
  }
}

class AddressInfo extends StatelessWidget {
  const AddressInfo({
    super.key,
    required this.address,
    required this.sdt,
    required this.name,
    required this.isSelected,
  });
  final String address;
  final String sdt;
  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          AddressShipping(
            address: address,
            name: name,
            sdt: sdt,
          ),
          isSelected
              ? const Column(
                  children: [
                    Text(
                      'Default',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.check,
                      color: Colors.deepOrange,
                    )
                  ],
                )
              : const SizedBox()
        ]),
      ),
    );
  }
}

class AddressShipping extends StatelessWidget {
  const AddressShipping({
    super.key,
    required this.name,
    required this.address,
    required this.sdt,
  });
  final String name;
  final String address;
  final String sdt;

  @override
  Widget build(BuildContext context) {
    String nameFitler =
        address.length > 35 ? '${address.substring(0, 36)}...' : address;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              sdt,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_pin,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              nameFitler,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            )
          ],
        )
      ],
    );
  }
}
