import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/space.dart';
import '../widgets/title_widgets.dart';
import 'pin_verification_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TitleWidgets(
                title: "Welcome Back",
                subtitle: "Please Enter Your Email Address"),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Email Address",
              ),
            ),
            verticalSpace(16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(const PinVerificationScreen());
                },
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
