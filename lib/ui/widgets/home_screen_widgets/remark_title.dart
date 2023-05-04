import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';

class RemarkTitle extends StatelessWidget {
  const RemarkTitle({
    Key? key,
    required this.label,
    required this.onSeeAllTap,
  }) : super(key: key);

  final String label;
  final VoidCallback onSeeAllTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            color: colorBlack,
          ),
        ),
        TextButton(
          onPressed: onSeeAllTap,
          child: const Text(
            "See All",
            style: TextStyle(color: colorPrimary),
          ),
        ),
      ],
    );
  }
}
