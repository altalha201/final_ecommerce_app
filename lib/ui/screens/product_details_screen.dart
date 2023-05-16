import 'package:final_ecommerce_app/ui/utils/application_colors.dart';
import 'package:final_ecommerce_app/ui/widgets/floating_price_widget.dart';
import 'package:final_ecommerce_app/ui/widgets/item_stepper.dart';
import 'package:final_ecommerce_app/ui/widgets/product_details_screen_widgets/product_image_carousel.dart';
import 'package:final_ecommerce_app/ui/widgets/space.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        leading: const BackButton(
          color: colorGray,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ProductImageCarousel(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Adidas Casual Shoe s4657 Brand new',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: appbarTextColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                verticalSpace(4.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 14,
                                        ),
                                        horizontalSpace(4.0),
                                        const Text(
                                          '4.5',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: iconColor),
                                        )
                                      ],
                                    ),
                                    horizontalSpace(8.0),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Reviews",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: colorPrimary,
                                        ),
                                      ),
                                    ),
                                    horizontalSpace(8.0),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: colorPrimary,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.favorite_border,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ItemStepper(controller: TextEditingController()),
                        ],
                      ),
                      verticalSpace(16.0),
                      Text(
                        "Colors",
                        style: TextStyle(
                          fontSize: 20,
                          color: appbarTextColor.withOpacity(0.8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          FloatingPriceWidget(
            priceText: "1000",
            onButtonTap: () {},
          )
        ],
      ),
    );
  }
}
