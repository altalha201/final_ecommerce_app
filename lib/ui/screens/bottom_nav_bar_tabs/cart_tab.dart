import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_manager/bottom_navigation_bar_controller.dart';
import '../../utils/application_colors.dart';
import '../../widgets/cart_screen_widgets/cart_item.dart';
import '../../widgets/floating_price_widget.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        leading: IconButton(
          splashColor: colorPrimary.withOpacity(0.1),
          onPressed: () {
            Get.find<BottomNavigationBarController>().backToHome();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  CartItem(),
                  CartItem(),
                  CartItem(),
                  CartItem(),
                  CartItem(),
                  CartItem(),
                  CartItem(),
                  CartItem(),
                ],
              ),
            ),
          ),
          FloatingPriceWidget(
            fromCart: true,
            priceText: "100,000.00",
            onButtonTap: () {},
          ),
        ],
      ),
    );
  }
}

