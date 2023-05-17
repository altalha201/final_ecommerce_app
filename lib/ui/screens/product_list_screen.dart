import 'package:flutter/material.dart';

import '../utils/application_colors.dart';
import '../widgets/product_list_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: const BackButton(color: colorGray,)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: 0.70,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return const ProductListItem();
          },
        ),
      ),
    );
  }
}
