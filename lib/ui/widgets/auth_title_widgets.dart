import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/application_colors.dart';
import 'space.dart';

class AuthTitleWidgets extends StatelessWidget {
  const AuthTitleWidgets({Key? key, required this.title, required this.subtitle}) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/images/logo.svg",
          width: 100,
        ),
        verticalSpace(16.0),
        Text(
          title,
          style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              color: colorBlack
          ),
        ),
        verticalSpace(4.0),
        Text(
          subtitle,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              color: colorGray
          ),
        ),
        verticalSpace(24.0),
      ],
    );
  }
}