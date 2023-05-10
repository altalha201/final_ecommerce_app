import 'package:flutter/material.dart';

import '../utils/application_colors.dart';

class FloatingPriceWidget extends StatelessWidget {
  const FloatingPriceWidget({
    Key? key,
    this.fromCart,
    required this.priceText,
    this.onButtonTap,
  }) : super(key: key);

  final bool? fromCart;
  final String priceText;
  final VoidCallback? onButtonTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(24.0),
          decoration: const BoxDecoration(
            color: colorSecondary,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fromCart ?? false ? "Total Price" : "Price",
                    style: const TextStyle(color: colorGray),
                  ),
                  Text(
                    "\$ $priceText",
                    style: const TextStyle(
                        fontSize: 18, color: colorPrimary, letterSpacing: 0.6),
                  )
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: onButtonTap,
                child: Text(fromCart ?? false ? "Check Out" : "Add To Cart"),
              )
            ],
          ),
        ),
      ],
    );
  }
}