import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/application_colors.dart';
import '../widgets/space.dart';
import '../widgets/title_widgets.dart';
import 'complete_profile_screen.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({Key? key}) : super(key: key);

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TitleWidgets(
              title: "Enter OTP Code",
              subtitle: "A 4 Digit OTP Code has been Sent",
            ),
            PinCodeTextField(
              appContext: context,
              length: 4,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 45,
                fieldWidth: 45,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
                selectedColor: Colors.green,
                activeColor: colorPrimary,
                inactiveColor: colorPrimary,
                inactiveFillColor: Colors.white,
              ),
              onCompleted: (value) {},
              onChanged: (value) {},
            ),
            verticalSpace(16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(const CompleteProfileScreen());
                },
                child: const Text("Next"),
              ),
            ),
            verticalSpace(24.0),
            RichText(
              text: const TextSpan(
                text: "This code will expire in ",
                style: TextStyle(fontSize: 13, color: colorGray),
                children: [
                  TextSpan(
                    text: "120s",
                    style: TextStyle(
                      color: colorPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(2.0),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Resend Code",
                  style: TextStyle(color: colorGray),
                ))
          ],
        ),
      ),
    );
  }
}
