import 'package:flutter/material.dart';

import '../utils/application_colors.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(backgroundColor: colorPrimary),
        child: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w500, letterSpacing: 0.5, fontSize: 18),
        ),
      ),
    );
  }
}
