import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_manager/product_list_controller.dart';
import '../utils/application_colors.dart';
import '../widgets/product_list_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen(
      {Key? key, this.categoryID, this.brandID, required this.listByCategory, required this.title})
      : super(key: key);

  final bool listByCategory;
  final String title;
  final int? categoryID;
  final int? brandID;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.listByCategory) {
      Get.find<ProductListController>().getProductsByCategory(categoryId: widget.categoryID!);
    } else {
      Get.find<ProductListController>().getProductsByBrand(brandId: widget.brandID!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          leading: const BackButton(
            color: colorGray,
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ProductListController>(
          builder: (listController) {
            if (listController.gettingProductList) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 0.70,
              ),
              itemCount: widget.listByCategory
                  ? (listController.productsByCategoryModel.products?.length ?? 0)
                  : (listController.productsByBrandModel.products?.length ?? 0),
              itemBuilder: (context, index) {
                final item = widget.listByCategory
                    ? listController.productsByCategoryModel.products!.elementAt(index)
                    : listController.productsByBrandModel.products!.elementAt(index);
                return ProductListItem(product: item);
              },
            );
          },
        ),
      ),
    );
  }
}
