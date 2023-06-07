import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/category_models/category.dart';
import '../screens/product_list_screen.dart';
import '../utils/application_colors.dart';
import 'space.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key, required this.categoryItem,
  }) : super(key: key);

  final Category categoryItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
          Get.to(ProductListScreen(
            listByCategory: true,
            categoryID: categoryItem.id,
            title: categoryItem.categoryName ?? '',
          ));
        },
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: colorPrimary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      categoryItem.categoryImg ?? '',
                    ),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              verticalSpace(4.0),
              Text(
                categoryItem.categoryName ?? '',
                style: const TextStyle(color: colorPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
