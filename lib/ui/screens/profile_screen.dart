import 'package:flutter/material.dart';

import '../utils/application_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        leading: const BackButton(color: colorGray,),
      ),
    );
  }
}
