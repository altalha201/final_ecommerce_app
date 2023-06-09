import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_manager/ui_states/home_nav_controller.dart';
import '../../state_manager/list_states/category_list_controller.dart';
import '../../utils/application_colors.dart';
import '../../widgets/card_widgets/category_card.dart';

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
            Get.find<HomeNavController>().backToHome();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<CategoryListController>(
          builder: (categoryController) {
            if (categoryController.getCategoriesInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                categoryController.getCategories();
              },
              child: GridView.builder(
                  itemCount: categoryController.categoryListModel.categories?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      childAspectRatio: 0.85),
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      categoryItem: categoryController.categoryListModel.categories!.elementAt(index)
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}
