import 'package:flutter/material.dart';

import '../utils/application_colors.dart';
import 'space.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.iconData,
    required this.labelString,
    required this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final String labelString;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.0),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 75,
              child: Card(
                color: colorSecondary,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    iconData,
                    size: 48,
                    color: colorPrimary,
                  ),
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
