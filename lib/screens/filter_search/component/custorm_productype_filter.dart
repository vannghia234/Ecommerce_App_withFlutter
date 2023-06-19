import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ProductTypeEnum {
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
List<ProductTypeEnum> listEnum = [
  ProductTypeEnum.tatCa,
  ProductTypeEnum.vitaminTPCN,
  ProductTypeEnum.chamSocCaNhan,
  ProductTypeEnum.hangTieuDung,
  ProductTypeEnum.tangCuongTheLuc,
  ProductTypeEnum.thoiTrang
];

class CustomProductTypeFilter extends StatefulWidget {
  const CustomProductTypeFilter({
    super.key,
    required this.currentEnum,
    required this.callback,
  });
  final ProductTypeEnum currentEnum;
  final Function(String) callback;

  @override
  State<CustomProductTypeFilter> createState() =>
      _CustomProductTypeFilterState(currentEnum);
}

class _CustomProductTypeFilterState extends State<CustomProductTypeFilter> {
  _CustomProductTypeFilterState(this.currentEnum);
  ProductTypeEnum currentEnum;

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
          const Divider(
            thickness: 1.5,
          ),
        ],
      ),
    );
  }

  ListTile listTileCustom(
      {required String text,
      ProductTypeEnum? value,
      required ProductTypeEnum groupValue}) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      leading: Radio<ProductTypeEnum>(
        value: value!,
        groupValue: groupValue,
        onChanged: (value) {
          setState(() {
            currentEnum = value!;
          });
          widget.callback(text);
        },
        fillColor: MaterialStateColor.resolveWith((states) => Colors.black),
        focusColor: MaterialStateColor.resolveWith((states) => Colors.black),
      ),
    );
  }
}
