import 'package:final_ecommerce_app/ui/state_manager/cart_states/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_manager/ui_states/home_nav_controller.dart';
import '../../utils/application_colors.dart';
import '../../widgets/cart_screen_widgets/cart_item_card.dart';
import '../../widgets/floating_price_widget.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {

  @override
  void initState() {
    super.initState();
    Get.find<CartController>().getCartList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        leading: IconButton(
          splashColor: colorPrimary.withOpacity(0.1),
          onPressed: () {
            Get.find<HomeNavController>().backToHome();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: GetBuilder<CartController>(
        builder: (cartController) {
          if (cartController.gettingCartItems) {
            return const Center(child: CircularProgressIndicator(),);
          }
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: cartController.cartListModel.cartItems!
                        .map((e) => CartItemCard(item: e,))
                        .toList(),
                  ),
                ),
              ),
              FloatingPriceWidget(
                fromCart: true,
                priceText: "100,000.00",
                onButtonTap: () {},
              ),
            ],
          );
        }
      ),
    );
  }
}

