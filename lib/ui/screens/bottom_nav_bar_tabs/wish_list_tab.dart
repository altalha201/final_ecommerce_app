import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';

class WishListTab extends StatelessWidget {
  const WishListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wish List",
          style: TextStyle(color: appbarTextColor),
        ),
        backgroundColor: colorWhite,
      ),
    );
  }
}
