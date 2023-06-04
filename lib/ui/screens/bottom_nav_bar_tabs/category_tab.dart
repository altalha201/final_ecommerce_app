import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_manager/bottom_navigation_bar_controller.dart';
import '../../state_manager/category_controller.dart';
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
        child: GetBuilder<CategoryController>(
          builder: (categoryController) {
            return GridView.builder(
                itemCount: categoryController.categoryModel.categories?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 0.85),
                itemBuilder: (context, index) {
                  final item = categoryController.categoryModel.categories!.elementAt(index);
                  return CategoryItem(
                      labelString: item.categoryName ?? "",
                      imageUrl: item.categoryImg ?? "",
                      id: item.id ?? 0,
                  );
                });
          },
        ),
      ),
    );
  }
}
