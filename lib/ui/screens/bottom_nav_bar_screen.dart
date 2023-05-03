import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  var bodyWidgets = [
    const HomeTab(),
    const CategoryTab(),
    const CartTab(),
    const WishListTab()
  ];

  var currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyWidgets[currentTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        selectedItemColor: colorPrimary,
        unselectedItemColor: iconColor,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        onTap: (value) {
          currentTab = value;
          if (mounted) {
            setState(() {});
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                "assets/icons/home.svg",
                height: 24,
                color: currentTab == 0 ? colorPrimary : iconColor,
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
                color: currentTab == 1 ? colorPrimary : iconColor,
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
                color: currentTab == 2 ? colorPrimary : iconColor,
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
                color: currentTab == 3 ? colorPrimary : iconColor,
              ),
            ),
            label: "Wish",
          ),
        ],
      ),
    );
  }
}
