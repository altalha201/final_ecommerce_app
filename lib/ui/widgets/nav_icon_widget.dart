import 'package:flutter/material.dart';

import '../utils/application_colors.dart';

class NavIconWidget extends StatelessWidget {

  final IconData? icon;
  final VoidCallback? onTap;

  const NavIconWidget({
    Key? key, this.icon, this.onTap,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 16,
        backgroundColor: colorGrayLite,
        child: Icon(icon, color: navIconColor,),
      ),
    );
  }
}