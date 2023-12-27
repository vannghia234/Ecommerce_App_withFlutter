import 'package:ecommerce_app/api/products/fetch_api.dart';
import 'package:ecommerce_app/models/product_list_response.dart';
import 'package:ecommerce_app/widget/show_loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/constant.dart';
import '../../../widget/view_detail_all_byList.dart';
import 'custom_sort_filter_search.dart';
import 'custorm_productype_filter.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String currentSort = 'Mặc định';
  String currentCate = 'Mặc định';

  void updateCurrentSort(String sort) {
    setState(() {
      currentSort = sort;
    });
    print(currentSort);
  }

  void updateCurrentCate(String cate) {
    setState(() {
      currentCate = cate;
    });
    print(currentCate);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SizedBox(
          width: Get.width,
          height: Get.height,
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
              CustomSortFilter(
                currentSort: SortBy.tatCa,
                press: (text) => updateCurrentSort(text),
              ),
              CustomProductTypeFilter(
                callback: (p0) => updateCurrentCate(p0),
                currentEnum: ProductTypeEnum.tatCa,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: kSecondaryColor.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                            child: Text(
                          'Đặt lại',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          if (currentSort == "Mặc định") {
                            switch (currentCate) {
                              case 'Mặc định':
                                {
                                  showLoadingAnimation(context);
                                  var response = await FetchApiProductService
                                      .instance
                                      .filterProduct(
                                          orderBy: "Mặc định",
                                          cateName: "Mặc định");
                                  Get.back();
                                  List<Product> list = response!.data!;

                                  Get.off(() => ViewDetailAllByList(
                                        productLists: list,
                                        title: 'Kết quả lọc',
                                      ));
                                  break;
                                }
                              case 'Vitamin & TPCN':
                                {
                                  showLoadingAnimation(context);
                                  var response = await FetchApiProductService
                                      .instance
                                      .filterProduct(
                                          orderBy: "",
                                          cateName:
                                              "Vitamin %26 thực phẩm chức năng");
                                  Get.back();
                                  List<Product> list = response!.data!;

                                  Get.off(() => ViewDetailAllByList(
                                        productLists: list,
                                        title: 'Kết quả lọc',
                                      ));
                                  break;
                                }
                              case 'Chăm sóc cá nhân & làm đẹp':
                                {
                                  showLoadingAnimation(context);
                                  var response = await FetchApiProductService
                                      .instance
                                      .filterProduct(
                                          orderBy: "",
                                          cateName:
                                              "Chăm sóc cá nhân %26 làm đẹp");
                                  Get.back();
                                  List<Product> list = response!.data!;

                                  Get.off(() => ViewDetailAllByList(
                                        productLists: list,
                                        title: 'Kết quả lọc',
                                      ));
                                  break;
                                }
                              case 'Hàng tiêu dùng & thực phẩm':
                                {
                                  showLoadingAnimation(context);
                                  var response = await FetchApiProductService
                                      .instance
                                      .filterProduct(
                                          orderBy: "",
                                          cateName:
                                              "Hàng tiêu dùng %26 thực phẩm");
                                  Get.back();
                                  List<Product> list = response!.data!;

                                  Get.off(() => ViewDetailAllByList(
                                        productLists: list,
                                        title: 'Kết quả lọc',
                                      ));
                                  break;
                                }
                              case 'Tăng cường thể lực':
                                {
                                  showLoadingAnimation(context);
                                  var response = await FetchApiProductService
                                      .instance
                                      .filterProduct(
                                          orderBy: "",
                                          cateName: "Tăng cường thể lực");
                                  Get.back();
                                  List<Product> list = response!.data!;

                                  Get.off(() => ViewDetailAllByList(
                                        productLists: list,
                                        title: 'Kết quả lọc',
                                      ));
                                  break;
                                }
                              case 'Thời trang':
                                {
                                  break;
                                }
                            }
                          } else if (currentCate == "Mặc định") {
                            switch (currentSort) {
                              case 'Mặc định':
                                {
                                  showLoadingAnimation(context);
                                  var response = await FetchApiProductService
                                      .instance
                                      .filterProduct(
                                          orderBy: "Mặc định",
                                          cateName: "Mặc định");
                                  Get.back();
                                  List<Product> list = response!.data!;

                                  Get.off(() => ViewDetailAllByList(
                                        productLists: list,
                                        title: 'Kết quả lọc',
                                      ));
                                  break;
                                }
                              case 'Mới nhất':
                                {
                                  break;
                                }
                              case 'Giá: thấp-cao':
                                {
                                  showLoadingAnimation(context);
                                  var response = await FetchApiProductService
                                      .instance
                                      .filterProduct(
                                          orderBy: "ASC", cateName: "");
                                  Get.back();
                                  List<Product> list = response!.data!;

                                  Get.off(() => ViewDetailAllByList(
                                        productLists: list,
                                        title: 'Kết quả lọc',
                                      ));
                                  break;
                                }
                              case 'Giá: cao-thấp':
                                {
                                  showLoadingAnimation(context);
                                  var response = await FetchApiProductService
                                      .instance
                                      .filterProduct(
                                          orderBy: "DESC", cateName: "");
                                  Get.back();
                                  List<Product> list = response!.data!;

                                  Get.off(() => ViewDetailAllByList(
                                        productLists: list,
                                        title: 'Kết quả lọc',
                                      ));
                                  break;
                                }
                            }
                          } else {
                            if (currentSort == 'Giá: thấp-cao') {
                              currentSort = "ASC";
                            } else if (currentSort == "Giá: cao-thấp") {
                              currentSort = "DESC";
                            } else {
                              currentSort = "Mặc định";
                            }
                            if (currentCate == 'Vitamin & TPCN') {
                              currentCate = 'Vitamin & thực phẩm chức năng';
                            }
                            String result = currentCate.replaceAll(r'&', '%26');
                            showLoadingAnimation(context);
                            var response = await FetchApiProductService.instance
                                .filterProduct(
                                    orderBy: currentSort, cateName: result);
                            Get.back();
                            List<Product> list = response!.data!;

                            Get.off(() => ViewDetailAllByList(
                                  productLists: list,
                                  title: 'Kết quả lọc',
                                ));
                          }
                        },
                        child: Container(
                          height: 50,
                          width: Get.width * 0.46,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                              child: Text(
                            'Áp dụng',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    )
                  ]),
            ],
          ),
        ),
      ),
    ));
  }
}
