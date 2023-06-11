import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../state_manager/product_states/products_by_remark_controller.dart';
import '../state_manager/ui_states/home_nav_controller.dart';
import '../state_manager/list_states/brand_list_controller.dart';
import '../state_manager/list_states/category_list_controller.dart';
import '../state_manager/home_slider_controller.dart';
import '../utils/application_colors.dart';
import 'home_screen_tabs/cart_tab.dart';
import 'home_screen_tabs/category_tab.dart';
import 'home_screen_tabs/primary_tab.dart';
import 'home_screen_tabs/wishlist_tab.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    if (Get.find<ProductsByRemarkController>().newProductsModel.msg == null) {
      Get.find<HomeSliderController>().getCarouselData();
      Get.find<CategoryListController>().getCategories();
      Get.find<BrandListController>().getBrands();
      Get.find<ProductsByRemarkController>().getPopularProducts();
      Get.find<ProductsByRemarkController>().getSpecialProducts();
      Get.find<ProductsByRemarkController>().getNewProducts();
    }
    super.initState();
  }

  final List<Widget> _bodyWidgets = const [
    PrimaryTab(),
    CategoryTab(),
    CartTab(),
    WishlistTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeNavController>(
        builder: (controller) {
          return _bodyWidgets[controller.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<HomeNavController>(
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
