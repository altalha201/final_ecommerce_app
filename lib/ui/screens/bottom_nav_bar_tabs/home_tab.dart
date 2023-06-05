import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../state_manager/auth_controller.dart';
import '../../state_manager/bottom_navigation_bar_controller.dart';
import '../../state_manager/category_controller.dart';
import '../../state_manager/home_controller.dart';
import '../../widgets/category_item.dart';
import '../../widgets/home_screen_widgets/appbar_icon_button.dart';
import '../../widgets/home_screen_widgets/home_carousel_slider.dart';
import '../../widgets/home_screen_widgets/remark_title.dart';
import '../../widgets/home_screen_widgets/search_text_field.dart';
import '../email_verification_screen.dart';
import '../profile_screen.dart';

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
                onTap: () {
                  final bool login = Get.find<AuthController>().isLoggedIn();
                  if (login) {
                    Get.to(ProfileScreen());
                  } else {
                    Get.to(const EmailVerificationScreen());
                  }
                },
              ),
              AppbarIconButton(
                iconData: Icons.phone_enabled_outlined,
                onTap: () {
                  // Get.to(const CompleteProfileScreen());
                },
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
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<HomeController>(
                builder: (homeController) {
                  if (homeController.getSliderInProgress) {
                    return const SizedBox(
                      height: 180,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return HomeCarouselSlider(
                    model: homeController.homeSliderData,
                  );
                }
              ),
              RemarkTitle(
                label: 'All Categories',
                onSeeAllTap: () {
                  Get.find<BottomNavigationBarController>().changeIndex(1);
                },
              ),
              GetBuilder<CategoryController>(
                  builder: (categoryController) {
                    if(categoryController.getCategoriesInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: categoryController.categoryListModel.categories!.map(
                                (e) => CategoryItem(
                                    labelString: e.categoryName.toString(),
                                    imageUrl: e.categoryImg.toString(),
                                    id: e.id ?? 0,
                                )).toList(),
                      ),
                    );
                  }
              ),
              RemarkTitle(
                label: 'Popular',
                onSeeAllTap: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                    Container(),
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
                  children: [
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                    Container(),
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
                  children: [
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                    Container(),
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
