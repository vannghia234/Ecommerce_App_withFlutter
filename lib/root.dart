import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/screens/cart/cart_screen.dart';
import 'package:ecommerce_app/screens/favourite/favourite_screen.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/screens/search-screen/search-screen.dart';
import 'package:ecommerce_app/screens/user_profile/user_profile_screen.dart';
import 'package:ecommerce_app/utils/rive-utils.dart';
import 'package:ecommerce_app/utils/rive_asset.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RootApp extends StatefulWidget {
  static String routeName = '/root-app';
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  RiveAssets selectedBottomNav = bottomNavs.first;
  late SMIBool userTigger;
  late SMIBool sideBarClosed;
  bool isSlideMenuclosed = true;
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        padding: const EdgeInsets.all(14),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 1, 9, 9),
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(bottomNavs.length, (index) {
              return itemsWidget(index);
            })
          ],
        ),
      )),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomeScreen(),
          SearchScreen(),
          FavouriteScreen(),
          CartScreen(),
          UserProfileScreen()
        ],
      ),
    );
  }

  GestureDetector itemsWidget(int index) {
    return GestureDetector(
      onTap: () {
        if (bottomNavs[index] != selectedBottomNav) {
          setState(() {
            selectedBottomNav = bottomNavs[index];
            _selectedIndex = index;
          });
        }
        bottomNavs[index].input!.change(true);
        Future.delayed(
          const Duration(seconds: 1),
          () {
            bottomNavs[index].input!.change(false);
          },
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 400),
            height: 4,
            width: selectedBottomNav == bottomNavs[index] ? 25 : 0,
            decoration: BoxDecoration(
                color: selectedBottomNav == bottomNavs[index]
                    ? kPrimaryColor
                    : const Color.fromARGB(0, 0, 0, 0),
                borderRadius: const BorderRadius.all(Radius.circular(14))),
          ),
          SizedBox(
              height: 40,
              width: 40,
              child: Opacity(
                opacity: bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                child: RiveAnimation.asset(
                  bottomNavs.first.src,
                  artboard: bottomNavs[index].artBoard,
                  onInit: (art) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(art,
                            stateMachineName:
                                bottomNavs[index].stateMachineName);
                    bottomNavs[index].setInput =
                        controller.findInput<bool>('active') as SMIBool;
                  },
                ),
              )),
        ],
      ),
    );

    // FlashyTabBar customBottomNav() {
    //   return FlashyTabBar(
    //     selectedIndex: _selectedIndex,
    //     showElevation: true,
    //     onItemSelected: (index) => setState(() {
    //       _selectedIndex = index;
    //     }),
    //     items: [
    //       FlashyTabBarItem(
    //         icon: const Icon(Icons.event),
    //         title: const Text('Home'),
    //       ),
    //       FlashyTabBarItem(
    //         icon: const Icon(Icons.search),
    //         title: const Text('Search'),
    //       ),
    //       FlashyTabBarItem(
    //         icon: const Icon(Icons.favorite_outline),
    //         title: const Text(
    //           'Favourite',
    //           style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    //         ),
    //       ),
    //       FlashyTabBarItem(
    //         icon: const Icon(Icons.shopping_bag_outlined),
    //         title: const Text('Bags'),
    //       ),
    //       FlashyTabBarItem(
    //         icon: const Icon(Icons.settings),
    //         title: const Text('Setting'),
    //       ),
    //     ],
    //   );
  }
}
