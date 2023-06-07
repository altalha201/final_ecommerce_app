import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/product_models/product.dart';
import '../state_manager/product_states/products_by_remark_controller.dart';
import '../widgets/card_widgets/product_card.dart';

class RemarkDetailsScreen extends StatelessWidget {
  const RemarkDetailsScreen(
      {Key? key,
      this.forNew,
      this.forPopular,
      this.forSpecial,
      required this.title})
      : super(key: key);

  final bool? forNew, forPopular, forSpecial;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ProductsByRemarkController>(
          builder: (controller) {
            if (controller.gettingPopularProducts || controller.gettingSpecialProducts || controller.gettingNewProducts) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<Product> products;
            if (forPopular ?? false) {
              products = controller.popularProductsModel.products!;
            } else if (forSpecial ?? false) {
              products = controller.specialProductsModel.products!;
            } else {
              products = controller.newProductsModel.products!;
            }
            return RefreshIndicator(
              onRefresh: () async {
                if (forPopular ?? false) {
                  controller.getPopularProducts();
                } else if (forSpecial ?? false) {
                  controller.getSpecialProducts();
                } else {
                  controller.getNewProducts();
                }
              },
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 0.70,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
