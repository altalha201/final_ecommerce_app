import 'package:final_ecommerce_app/ui/screens/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/space.dart';
import '../widgets/title_widgets.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const TitleWidgets(
                      title: "Complete Profile",
                      subtitle: "Get started with us with your details"),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "First Name",
                    ),
                  ),
                  verticalSpace(8.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Last Name",
                    ),
                  ),
                  verticalSpace(8.0),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: "Mobile",
                    ),
                  ),
                  verticalSpace(8.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "City",
                    ),
                  ),
                  verticalSpace(8.0),
                  TextFormField(
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: "Shipping Address",
                    ),
                  ),
                  verticalSpace(16.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(const BottomNavBarScreen());
                      },
                      child: const Text("Complete"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
