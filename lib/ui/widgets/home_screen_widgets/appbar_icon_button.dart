import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';

class AppbarIconButton extends StatelessWidget {
  const AppbarIconButton({
    Key? key,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      splashColor: colorPrimary.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(
          radius: 14,
          backgroundColor: colorGrayLite,
          child: Icon(
            iconData,
            size: 16,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
