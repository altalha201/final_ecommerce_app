import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/brand_models/brand.dart';
import '../screens/product_list_screen.dart';
import '../utils/application_colors.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({Key? key, required this.brandItem}) : super(key: key);

  final Brand brandItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
          Get.to(ProductListScreen(
            listByCategory: false,
            title: brandItem.brandName ?? '',
            brandID: brandItem.id,
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
                    image: NetworkImage(brandItem.brandImg ?? ''),
                  ),
                ),
              ),
              Text(brandItem.brandName ?? 'Unknown'),
            ],
          ),
        ),
      ),
    );
  }
}
