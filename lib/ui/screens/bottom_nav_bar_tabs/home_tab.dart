import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/home_screen_widgets/appbar_icon_button.dart';
import '../../widgets/home_screen_widgets/home_carousel_slider.dart';
import '../../widgets/home_screen_widgets/remark_title.dart';
import '../../widgets/home_screen_widgets/search_text_field.dart';
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
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SearchTextField(),
            verticalSpace(16.0),
            HomeCarouselSlider(),
            verticalSpace(8.0),
            RemarkTitle(
              label: 'All Categories',
              onSeeAllTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
