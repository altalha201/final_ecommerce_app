import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_manager/bottom_navigation_bar_controller.dart';
import '../../utils/application_colors.dart';
import '../../widgets/category_item.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        leading: IconButton(
          splashColor: colorPrimary.withOpacity(0.1),
          onPressed: () {
            Get.find<BottomNavigationBarController>().backToHome();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 0.85),
            itemBuilder: (context, index) {
              return CategoryItem(
                iconData: Icons.tv,
                labelString: "Electronics",
                onTap: () {},
              );
            }),
      ),
    );
  }
}
