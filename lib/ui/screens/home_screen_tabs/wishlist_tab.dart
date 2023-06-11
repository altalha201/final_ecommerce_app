import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_manager/ui_states/home_nav_controller.dart';
import '../../utils/application_colors.dart';

class WishlistTab extends StatelessWidget {
  const WishlistTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wish List"),
        leading: IconButton(
          splashColor: colorPrimary.withOpacity(0.1),
          onPressed: () {
            Get.find<HomeNavController>().backToHome();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: 0.70,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container();
          },
        ),
      ),
    );
  }
}
