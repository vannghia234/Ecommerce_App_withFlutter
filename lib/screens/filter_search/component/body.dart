import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_sort_filter_search.dart';
import 'custorm_productype_filter.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Bộ lọc',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              thickness: 1.5,
            ),
            const CustomSortFilter(currentSort: SortBy.tatCa),
            const CustomProductTypeFilter(
              currentEnum: ProductType.tatCa,
            )
          ],
        ),
      ),
    ));
  }
}
