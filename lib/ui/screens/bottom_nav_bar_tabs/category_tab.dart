import 'package:flutter/material.dart';

import '../../widgets/category_item.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 0.85),
            itemBuilder: (context, index) {
              return CategoryItem(
                iconData: Icons.tv,
                labelString: "Electronics",
                onTap: () {},
              );
            }),
      ),
    );
  }
}
