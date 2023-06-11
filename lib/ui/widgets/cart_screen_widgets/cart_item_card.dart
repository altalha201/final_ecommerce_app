import 'package:final_ecommerce_app/data/models/cart_models/cart_item.dart';
import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';
import '../item_stepper.dart';
import '../space.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key, required this.item,
  }) : super(key: key);

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 140,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2,
        shadowColor: colorPrimary.withOpacity(0.2),
        child: Row(
          children: [
            Image.network(
              item.product?.image ?? "https://photo.teamrabbil.com/images/2023/04/04/product.png",
              height: 140,
              width: 120,
              fit: BoxFit.scaleDown,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.product?.title ?? "Unknown",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: appbarTextColor.withOpacity(0.7),
                                ),
                              ),
                              verticalSpace(4.0),
                              Text(
                                "Color: ${item.color}, Size: ${item.size}",
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: appbarTextColor.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete_outline_outlined,
                              color: colorPrimary,
                            ))
                      ],
                    ),
                    // verticalSpace(8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$ ${item.product?.price ?? 0}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: colorPrimary,
                          ),
                        ),
                        horizontalSpace(52.0),
                        ItemStepper(controller: TextEditingController())
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
