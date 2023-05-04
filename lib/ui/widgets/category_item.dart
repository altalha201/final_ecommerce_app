import 'package:flutter/material.dart';

import '../utils/application_colors.dart';
import 'space.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.iconData,
    required this.labelString,
    this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final String labelString;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.0),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: colorPrimary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  iconData,
                  size: 28,
                  color: colorPrimary,
                ),
              ),
            ),
            verticalSpace(4.0),
            Text(
              labelString,
              style: const TextStyle(color: colorPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
