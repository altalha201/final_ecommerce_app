import 'package:flutter/material.dart';

class SVGIcon extends StatelessWidget {
  const SVGIcon(
      {super.key, required this.icon});

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 24,
        height: 24,
        child: icon
    );
  }
}
