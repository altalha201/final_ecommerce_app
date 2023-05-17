import 'package:final_ecommerce_app/ui/screens/reviews_screen.dart';
import 'package:final_ecommerce_app/ui/utils/application_colors.dart';
import 'package:final_ecommerce_app/ui/widgets/floating_price_widget.dart';
import 'package:final_ecommerce_app/ui/widgets/item_stepper.dart';
import 'package:final_ecommerce_app/ui/widgets/product_details_screen_widgets/product_image_carousel.dart';
import 'package:final_ecommerce_app/ui/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colors = const [
    Color(0xFF000000),
    Color(0xFF7B2828),
    Color(0xFF251497),
    Color(0xFF08781A),
    Color(0xFF7E0472),
  ];

  List<String> sizes = const [
    'S',
    'L',
    'XL',
    'XXL',
    'XXXL',
  ];

  Color _selectedColor = const Color(0xFF000000);
  String _selectedSize = 'L';

  TextStyle headlineTextStyle() {
    return TextStyle(
      fontSize: 18,
      color: appbarTextColor.withOpacity(0.8),
      fontWeight: FontWeight.w600,
    );
  }

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
                            onPressed: () {
                              Get.to(const ReviewsScreen());
                            },
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
                          ),
                          const Spacer(),
                          ItemStepper(controller: TextEditingController())
                        ],
                      ),
                      verticalSpace(16.0),
                      Text(
                        "Colors",
                        style: headlineTextStyle(),
                      ),
                      verticalSpace(16.0),
                      Row(
                        children: colors.map((color) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                if (_selectedColor != color) {
                                  _selectedColor = color;
                                  if (mounted) {
                                    setState(() {});
                                  }
                                }
                              },
                              child: CircleAvatar(
                                backgroundColor: color,
                                radius: 15,
                                child: Visibility(
                                  visible: _selectedColor == color,
                                  child: const Icon(
                                    Icons.check,
                                    color: colorWhite,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      verticalSpace(16.0),
                      Text(
                        "Size",
                        style: headlineTextStyle(),
                      ),
                      verticalSpace(16.0),
                      Row(
                        children: sizes.map((size) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(6),
                              onTap: () {
                                if (_selectedSize != size) {
                                  _selectedSize = size;
                                  if (mounted) {
                                    setState(() {});
                                  }
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: colorGray,
                                  ),
                                  color: size == _selectedSize
                                      ? colorPrimary
                                      : null,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    size,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: size == _selectedSize
                                            ? colorWhite
                                            : null),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      verticalSpace(16.0),
                      Text(
                        "Description",
                        style: headlineTextStyle(),
                      ),
                      verticalSpace(16.0),
                      const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
                        style: TextStyle(
                          fontSize: 14,
                          color: colorGray,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      verticalSpace(200.0),
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
