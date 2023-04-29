import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(color: appbarTextColor),
        ),
        backgroundColor: colorWhite,
      ),
    );
  }
}
