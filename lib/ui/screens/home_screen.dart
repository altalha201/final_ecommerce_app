import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/application_colors.dart';
import '../widgets/svg_icon.dart';
import 'home_screen_tabs/cart_tab.dart';
import 'home_screen_tabs/category_tab.dart';
import 'home_screen_tabs/home_tab.dart';
import 'home_screen_tabs/wish_list_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
          setState(() {
            currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SVGIcon(
              icon: SVGIcon(icon: SvgPicture.asset(
                "assets/icons/home.svg",
                color: currentTab == 0 ? colorPrimary : iconColor,),),
            ),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: SVGIcon(icon: SvgPicture.asset(
              "assets/icons/category.svg",
              color: currentTab == 1 ? colorPrimary : iconColor,),),
            label: "Categories"
          ),
          BottomNavigationBarItem(
            icon: SVGIcon(icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              color: currentTab == 2 ? colorPrimary : iconColor,),),
            label: "Cart"
          ),
          BottomNavigationBarItem(
            icon: SVGIcon(icon: SvgPicture.asset(
              "assets/icons/wish.svg",
              color: currentTab == 3 ? colorPrimary : iconColor,),),
            label: "Wish"
          ),
        ],
      ),
    );
  }
}

