import 'package:ecommerce_app/screens/cart/cart_screen.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/screens/search-screen/search-screen.dart';
import 'package:ecommerce_app/screens/user_profile/user_profile_screen.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  static String routeName = '/root-app';
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomeScreen(),
          SearchScreen(),
          SearchScreen(),
          CartScreen(),
          UserProfileScreen()
        ],
      ),
    );
  }

  FlashyTabBar customBottomNav() {
    return FlashyTabBar(
      selectedIndex: _selectedIndex,
      showElevation: true,
      onItemSelected: (index) => setState(() {
        _selectedIndex = index;
      }),
      items: [
        FlashyTabBarItem(
          icon: const Icon(Icons.event),
          title: const Text('Home'),
        ),
        FlashyTabBarItem(
          icon: const Icon(Icons.search),
          title: const Text('Search'),
        ),
        FlashyTabBarItem(
          icon: const Icon(Icons.favorite_outline),
          title: const Text(
            'Favourite',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        FlashyTabBarItem(
          icon: const Icon(Icons.shopping_bag_outlined),
          title: const Text('Bags'),
        ),
        FlashyTabBarItem(
          icon: const Icon(Icons.settings),
          title: const Text('Setting'),
        ),
      ],
    );
  }
}
