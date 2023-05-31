import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ProductType {
  tatCa,
  vitaminTPCN,
  chamSocCaNhan,
  hangTieuDung,
  tangCuongTheLuc,
  thoiTrang
}

List<String> listsProductType = [
  'Mặc định',
  'Vitamin & TPCN',
  'Chăm sóc cá nhân & làm đẹp',
  'Hàng tiêu dùng & thực phẩm',
  'Tăng cường thể lực',
  'Thời trang'
];
List<ProductType> listEnum = [
  ProductType.tatCa,
  ProductType.vitaminTPCN,
  ProductType.chamSocCaNhan,
  ProductType.hangTieuDung,
  ProductType.tangCuongTheLuc,
  ProductType.thoiTrang
];

class CustomProductTypeFilter extends StatefulWidget {
  const CustomProductTypeFilter({
    super.key,
    required this.currentEnum,
  });
  final ProductType currentEnum;

  @override
  State<CustomProductTypeFilter> createState() =>
      _CustomProductTypeFilterState(currentEnum);
}

class _CustomProductTypeFilterState extends State<CustomProductTypeFilter> {
  _CustomProductTypeFilterState(this.currentEnum);
  ProductType currentEnum;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Danh mục',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          ...List.generate(
            listsProductType.length,
            (index) => listTileCustom(
                groupValue: currentEnum,
                text: listsProductType[index],
                value: listEnum[index]),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1.5,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  ListTile listTileCustom(
      {required String text,
      ProductType? value,
      required ProductType groupValue}) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      leading: Radio<ProductType>(
        value: value!,
        groupValue: groupValue,
        onChanged: (value) {
          setState(() {
            currentEnum = value!;
          });
        },
        fillColor: MaterialStateColor.resolveWith((states) => Colors.black),
        focusColor: MaterialStateColor.resolveWith((states) => Colors.black),
      ),
    );
  }
}
