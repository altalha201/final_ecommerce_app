import 'package:final_ecommerce_app/ui/utils/application_colors.dart';
import 'package:final_ecommerce_app/ui/widgets/nav_icon_widget.dart';
import 'package:final_ecommerce_app/ui/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorWhite,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SvgPicture.asset("assets/images/logo_nav.svg"),
        ),
        leadingWidth: 250,
        actions: [
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                NavIconWidget(icon: Icons.person_outline,),
                NavIconWidget(icon: Icons.call_outlined,),
                NavIconWidget(icon: Icons.notifications_active_outlined,),
            ],),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Search",
                fillColor: colorGrayLite,
                filled: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(16.0),
                prefixIcon: Icon(Icons.search)
              ),
            ),
            verticalSpace(16.0),

          ],
        ),
      ),
    );
  }
}
