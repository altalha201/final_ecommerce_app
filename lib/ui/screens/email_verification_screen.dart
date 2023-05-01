import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/common_elevated_button.dart';
import '../widgets/common_input_field.dart';
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
            const TitleWidgets(title: "Welcome Back", subtitle: "Please Enter Your Email Address"),
            const CommonInputField(
              hint: 'Email Address',
              inputType: TextInputType.emailAddress,
            ),
            verticalSpace(16.0),
            CommonElevatedButton(
              title: 'Next',
              onTap: () {
                Get.to(const PinVerificationScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
