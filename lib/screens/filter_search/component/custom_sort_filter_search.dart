import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SortBy { tatCa, moiNhat, thapDenCao, caoDenThap }

class CustomSortFilter extends StatefulWidget {
  const CustomSortFilter({
    super.key,
    required this.currentSort,
    required this.press,
  });
  final SortBy currentSort;
  final Function(String) press;

  @override
  State<CustomSortFilter> createState() => _CustomSortFilterState(currentSort);
}

class _CustomSortFilterState extends State<CustomSortFilter> {
  _CustomSortFilterState(this.sortBy);
  SortBy sortBy;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sắp xếp ',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          listTileCustom(groupValue: sortBy, text: 'Mặc định'),
          listTileCustom(
              groupValue: sortBy, text: 'Mới nhất', value: SortBy.moiNhat),
          listTileCustom(
              groupValue: sortBy,
              text: 'Giá: thấp-cao',
              value: SortBy.thapDenCao),
          listTileCustom(
              groupValue: sortBy,
              text: 'Giá: cao-thấp',
              value: SortBy.caoDenThap),
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
      SortBy value = SortBy.tatCa,
      required SortBy groupValue}) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
      leading: Radio<SortBy>(
        value: value,
        groupValue: groupValue,
        onChanged: (value) {
          setState(() {
            sortBy = value!;
          });
          widget.press(text);
        },
        fillColor: MaterialStateColor.resolveWith((states) => Colors.black),
        focusColor: MaterialStateColor.resolveWith((states) => Colors.black),
      ),
    );
  }
}
