import 'package:final_ecommerce_app/ui/screens/brand_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../state_manager/list_states/brand_list_controller.dart';
import '../../state_manager/product_states/products_by_remark_controller.dart';
import '../../state_manager/user_states/cache_controller.dart';
import '../../state_manager/ui_states/bottom_navigation_bar_controller.dart';
import '../../state_manager/list_states/category_list_controller.dart';
import '../../state_manager/home_slider_controller.dart';
import '../../widgets/card_widgets/brand_card.dart';
import '../../widgets/card_widgets/category_card.dart';
import '../../widgets/home_screen_widgets/appbar_icon_button.dart';
import '../../widgets/home_screen_widgets/home_carousel_slider.dart';
import '../../widgets/home_screen_widgets/remark_title.dart';
import '../../widgets/home_screen_widgets/search_text_field.dart';
import '../../widgets/card_widgets/product_card.dart';
import '../email_verification_screen.dart';
import '../profile_screen.dart';
import '../remark_details_screen.dart';

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
                onTap: () async {
                  final bool login = await Get.find<CacheController>().isLoggedIn();
                  if (login) {
                    Get.to(ProfileScreen());
                  } else {
                    Get.to(const EmailVerificationScreen());
                  }
                },
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
              GetBuilder<HomeSliderController>(builder: (homeController) {
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
              }),
              RemarkTitle(
                label: 'All Categories',
                onSeeAllTap: () {
                  Get.find<BottomNavigationBarController>().changeIndex(1);
                },
              ),
              GetBuilder<CategoryListController>(builder: (categoryController) {
                if (categoryController.getCategoriesInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: categoryController.categoryListModel.categories!
                        .map((e) => CategoryCard(
                              categoryItem: e,
                            ))
                        .toList(),
                  ),
                );
              }),
              RemarkTitle(label: 'Brands With Us', onSeeAllTap: () {
                Get.to(const BrandListScreen());
              }),
              GetBuilder<BrandListController>(builder: (brandListController) {
                if (brandListController.getBrandsInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: brandListController.brandListModel.brands!
                        .map((e) => BrandCard(brandItem: e))
                        .toList(),
                  ),
                );
              }),
              RemarkTitle(
                label: 'Popular',
                onSeeAllTap: () {
                  Get.to(const RemarkDetailsScreen(title: 'Popular', forPopular: true,));
                },
              ),
              GetBuilder<ProductsByRemarkController>(
                  builder: (remarkController) {
                if (remarkController.gettingPopularProducts) {
                  return const SizedBox(
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: remarkController.popularProductsModel.products!
                        .map((e) => ProductCard(product: e))
                        .toList(),
                  ),
                );
              }),
              RemarkTitle(
                label: 'Special',
                onSeeAllTap: () {
                  Get.to(const RemarkDetailsScreen(title: 'Special', forSpecial: true,));
                },
              ),
              GetBuilder<ProductsByRemarkController>(
                  builder: (remarkController) {
                    if (remarkController.gettingSpecialProducts) {
                      return const SizedBox(
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: remarkController.specialProductsModel.products!
                            .map((e) => ProductCard(product: e))
                            .toList(),
                      ),
                    );
                  }),
              RemarkTitle(
                label: 'New',
                onSeeAllTap: () {
                  Get.to(const RemarkDetailsScreen(title: 'New', forNew: true,));
                },
              ),
              GetBuilder<ProductsByRemarkController>(
                  builder: (remarkController) {
                    if (remarkController.gettingNewProducts) {
                      return const SizedBox(
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: remarkController.newProductsModel.products!
                            .map((e) => ProductCard(product: e))
                            .toList(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
