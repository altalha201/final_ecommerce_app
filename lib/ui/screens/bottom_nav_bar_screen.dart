import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../state_manager/bottom_navigation_bar_controller.dart';
import '../state_manager/home_controller.dart';
import '../utils/application_colors.dart';
import 'bottom_nav_bar_tabs/cart_tab.dart';
import 'bottom_nav_bar_tabs/category_tab.dart';
import 'bottom_nav_bar_tabs/home_tab.dart';
import 'bottom_nav_bar_tabs/wish_list_tab.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {

  @override
  void initState() {
    Get.find<HomeController>().getCarouselData();
    super.initState();
  }

  final List<Widget> _bodyWidgets = const [
    HomeTab(),
    CategoryTab(),
    CartTab(),
    WishListTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationBarController>(
        builder: (controller) {
          return _bodyWidgets[controller.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationBarController>(
        builder: (controller) {
          return BottomNavigationBar(
            currentIndex: controller.selectedIndex,
            selectedItemColor: colorPrimary,
            unselectedItemColor: iconColor,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            onTap: (value) {
              controller.changeIndex(value);
            },
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    "assets/icons/home.svg",
                    height: 24,
                    color: controller.selectedIndex == 0 ? colorPrimary : iconColor,
                  ),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    "assets/icons/category.svg",
                    height: 24,
                    color: controller.selectedIndex == 1 ? colorPrimary : iconColor,
                  ),
                ),
                label: "Categories",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    "assets/icons/cart.svg",
                    height: 24,
                    color: controller.selectedIndex == 2 ? colorPrimary : iconColor,
                  ),
                ),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    "assets/icons/wish.svg",
                    height: 24,
                    color: controller.selectedIndex == 3 ? colorPrimary : iconColor,
                  ),
                ),
                label: "Wish",
              ),
            ],
          );
        },
      ),
    );
  }
}
