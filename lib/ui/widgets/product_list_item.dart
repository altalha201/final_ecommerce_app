import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/product_models/product.dart';
import '../screens/product_details_screen.dart';
import '../utils/application_colors.dart';
import 'space.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    Key? key, required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: InkWell(
        onTap: () {
          Get.to(const ProductDetailsScreen());
        },
        borderRadius: BorderRadius.circular(10.0),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          shadowColor: colorPrimary.withOpacity(0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.image ?? '',
                width: 132,
                height: 90,
                fit: BoxFit.scaleDown,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      product.title ?? 'Unknown',
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.3,
                        height: 1.2,
                        fontWeight: FontWeight.w500,
                        color: appbarTextColor.withOpacity(0.8),
                      ),
                    ),
                    verticalSpace(4.0),
                    Row(
                      children: [
                        Text(
                          "\$ ${product.price}",
                          style: const TextStyle(
                              fontSize: 12,
                              color: colorPrimary,
                              fontWeight: FontWeight.w500),
                        ),
                        horizontalSpace(4.0),
                        Wrap(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14,
                            ),
                            Text(
                              '${product.star ?? 0}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: colorGray,
                              ),
                            )
                          ],
                        ),
                        horizontalSpace(8.0),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: colorPrimary,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.favorite_border_outlined,
                                  size: 12,
                                  color: colorWhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
