import 'package:final_ecommerce_app/ui/widgets/space.dart';
import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categories",
          style: TextStyle(color: appbarTextColor),
        ),
        backgroundColor: colorWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 0
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children:  [
                  const Card(
                    color: colorSecondary,
                    elevation: 0,
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(Icons.tv, size: 48, color: colorPrimary,),
                    ),
                  ),
                  verticalSpace(4.0),
                  const Text("Electronics", style: TextStyle(color: colorPrimary),)
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
