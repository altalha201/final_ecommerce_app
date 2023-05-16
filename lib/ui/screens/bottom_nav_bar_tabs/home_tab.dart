import 'package:final_ecommerce_app/ui/state_manager/bottom_navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../widgets/category_item.dart';
import '../../widgets/home_screen_widgets/appbar_icon_button.dart';
import '../../widgets/home_screen_widgets/home_carousel_slider.dart';
import '../../widgets/home_screen_widgets/remark_title.dart';
import '../../widgets/home_screen_widgets/search_text_field.dart';
import '../../widgets/product_list_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              SvgPicture.asset("assets/images/logo_nav.svg"),
              const Spacer(),
              AppbarIconButton(
                iconData: Icons.person_outline,
                onTap: () {},
              ),
              AppbarIconButton(
                iconData: Icons.phone_enabled_outlined,
                onTap: () {},
              ),
              AppbarIconButton(
                iconData: Icons.notifications_active_outlined,
                onTap: () {},
              ),
            ],
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SearchTextField(),
          ),),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeCarouselSlider(),
              RemarkTitle(
                label: 'All Categories',
                onSeeAllTap: () {
                  Get.find<BottomNavigationBarController>().changeIndex(1);
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CategoryItem(iconData: Icons.tv, labelString: "Electronics"),
                    CategoryItem(iconData: Icons.person, labelString: "Cloths"),
                    CategoryItem(iconData: Icons.drive_eta, labelString: "Car"),
                    CategoryItem(iconData: Icons.emoji_food_beverage_outlined, labelString: "Food"),
                    CategoryItem(iconData: Icons.phone_android, labelString: "Mobile"),
                    CategoryItem(iconData: Icons.bed_outlined, labelString: "Furniture"),
                  ],
                ),
              ),
              RemarkTitle(
                label: 'Popular',
                onSeeAllTap: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem(),
                  ],
                ),
              ),
              RemarkTitle(
                label: 'Special',
                onSeeAllTap: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem(),
                  ],
                ),
              ),
              RemarkTitle(
                label: 'New',
                onSeeAllTap: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
