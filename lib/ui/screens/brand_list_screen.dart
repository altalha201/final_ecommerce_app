import 'package:final_ecommerce_app/ui/state_manager/list_states/brand_list_controller.dart';
import 'package:final_ecommerce_app/ui/widgets/card_widgets/brand_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandListScreen extends StatelessWidget {
  const BrandListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brands"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<BrandListController>(
          builder: (brandController) {
            if (brandController.getBrandsInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                brandController.getBrands();
              },
              child: GridView.builder(
                itemCount: brandController.brandListModel.brands?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      childAspectRatio: 0.85),
                  itemBuilder: (context, index) {
                    return BrandCard(brandItem: brandController.brandListModel.brands![index]);
                  }
              ),
            );
          },
        ),
      ),
    );
  }
}
