import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/screens/search-screen/components/all-product-list.dart';
import 'package:flutter/material.dart';

import 'custom-product-list.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
              SizedBox(
                height: 35,
                child: TabBar(
                  onTap: (value) {
                    print('ban da tap');
                  },
                  padding: const EdgeInsets.only(right: 10),
                  isScrollable: true,
                  dividerColor: Colors.red,
                  controller: _tabController,
                  indicator: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8)),
                  indicatorColor: Colors.black,
                  indicatorWeight: 2,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: const TextStyle(fontSize: 14),
                  tabs: const [
                    //Todo load danh muc len day
                    Tab(text: 'All'),
                    Tab(text: 'Vitamin&TPCN'),
                    Tab(text: 'Tăng cường thể lực'),
                    Tab(text: 'Chăm sóc cá nhân&làm đẹp'),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    AllProductList(),
                    CustomProductListLayout(),
                    CustomProductListLayout(),
                    CustomProductListLayout(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
