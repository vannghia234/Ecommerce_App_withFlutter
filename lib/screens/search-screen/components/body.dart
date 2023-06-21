import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/models/product_list_response.dart';
import 'package:ecommerce_app/widget/show_loading_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../widget/tabbar_view_product.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ProductController controler;
  late List<Category> listCategory; // danh sách category
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controler = Get.find<ProductController>();
    listCategory = controler.listAllCategory;
    _tabController = TabController(length: listCategory.length, vsync: this);
    loadAllProductTabbar();
  }

  void loadAllProductTabbar() async {
    await controler.loadAllProductTabbar();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Shop',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                child: TabBar(
                  onTap: (value) {
                    if (value == 0) {
                      showLoadingAnimationTabbar(context);
                      controler.loadAllProductTabbar();
                      Get.back();
                      return;
                    }
                    controler.loadProductByCategory(
                        listCategory[value].categoryName!);
                  },

                  isScrollable: true,

                  dividerColor: Colors.red,
                  controller: _tabController,
                  indicator: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12)),
                  indicatorColor: Colors.black,
                  indicatorWeight: 2,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  tabs: [
                    //Todo load danh muc len day
                    ...List.generate(
                      listCategory.length,
                      (index) => Tab(text: listCategory[index].categoryName),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ...List.generate(listCategory.length, (index) {
                      return TabbarViewProduct(
                        productLists: controler.listResultSearchTabbar,
                      );
                    })
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
