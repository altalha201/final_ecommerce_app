import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_manager/bottom_navigation_bar_controller.dart';
import '../../utils/application_colors.dart';
import '../../widgets/product_list_item.dart';

class WishListTab extends StatelessWidget {
  const WishListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wish List"),
        leading: IconButton(
          splashColor: colorPrimary.withOpacity(0.1),
          onPressed: () {
            Get.find<BottomNavigationBarController>().backToHome();
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
            return const ProductListItem();
          },
        ),
      ),
    );
  }
}
