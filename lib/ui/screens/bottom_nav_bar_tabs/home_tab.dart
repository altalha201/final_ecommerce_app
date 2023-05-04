import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/category_item.dart';

import '../../widgets/home_screen_widgets/appbar_icon_button.dart';
import '../../widgets/home_screen_widgets/home_carousel_slider.dart';
import '../../widgets/home_screen_widgets/remark_title.dart';
import '../../widgets/home_screen_widgets/search_text_field.dart';
import '../../widgets/product_list_item.dart';
import '../../widgets/space.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
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
              verticalSpace(8.0),
              RemarkTitle(
                label: 'All Categories',
                onSeeAllTap: () {},
              ),
              SizedBox(
                height: 84,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CategoryItem(iconData: Icons.tv, labelString: "Electronics"),
                    CategoryItem(iconData: Icons.tv, labelString: "Cloths"),
                    CategoryItem(iconData: Icons.tv, labelString: "Car"),
                    CategoryItem(iconData: Icons.tv, labelString: "Food"),
                    CategoryItem(iconData: Icons.tv, labelString: "Mobile"),
                    CategoryItem(iconData: Icons.tv, labelString: "Furniture"),
                  ],
                ),
              ),
              verticalSpace(8.0),
              RemarkTitle(
                label: 'Popular',
                onSeeAllTap: () {},
              ),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem()
                  ],
                ),
              ),
              verticalSpace(8.0),
              RemarkTitle(
                label: 'Special',
                onSeeAllTap: () {},
              ),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem()
                  ],
                ),
              ),
              verticalSpace(8.0),
              RemarkTitle(
                label: 'New',
                onSeeAllTap: () {},
              ),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem(),
                    ProductListItem()
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
