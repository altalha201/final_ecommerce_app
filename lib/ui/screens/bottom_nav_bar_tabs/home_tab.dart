import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/application_colors.dart';
import '../../widgets/appbar_icon_button.dart';
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
            TextFormField(
              decoration: InputDecoration(
                hintText: "Search",
                fillColor: colorGrayLite,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: colorGrayLite),
                    borderRadius: BorderRadius.circular(8.0)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: colorGrayLite),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: const EdgeInsets.all(16.0),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: colorPrimary,
              ),
            ),
            verticalSpace(16.0),
          ],
        ),
      ),
    );
  }
}
