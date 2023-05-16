import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';
import '../item_stepper.dart';
import '../space.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
  }) : super(key: key);

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
            Image.asset(
              "assets/images/dummy_shoe.jpg",
              height: 140,
              width: 120,
              fit: BoxFit.fitHeight,
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
                                "New Year Special Shoe",
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
                                "Color: Red, Size: X",
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
                        const Text(
                          "\$ 100",
                          style: TextStyle(
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
