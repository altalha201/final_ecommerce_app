import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/product_list_screen.dart';
import '../utils/application_colors.dart';
import 'space.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.labelString,
    required this.imageUrl,
    required this.id,
  }) : super(key: key);

  final String labelString, imageUrl;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
          Get.to(ProductListScreen(listByCategory: true, categoryID: id, title: labelString,));
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
                        imageUrl,
                    ),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              verticalSpace(4.0),
              Text(
                labelString,
                style: const TextStyle(color: colorPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
