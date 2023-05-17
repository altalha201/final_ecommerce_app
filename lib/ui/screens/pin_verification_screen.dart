import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../state_manager/otp_expire_timer_controller.dart';
import '../state_manager/user_auth_controller.dart';
import '../utils/application_colors.dart';
import '../widgets/space.dart';
import '../widgets/title_widgets.dart';
import 'bottom_nav_bar_screen.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({Key? key, required this.email})
      : super(key: key);

  final String email;

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController _pinETController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Get.find<OTPExpireTimerController>().startCountdown();

    return Scaffold(
      body: GetBuilder<UserAuthController>(builder: (authController) {
        return Padding(
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
                controller: _pinETController,
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
              Visibility(
                  visible: authController.pinVerificationInProgress,
                  replacement: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final bool response =
                            await authController.pinVerification(
                                widget.email, _pinETController.text);
                        if (response) {
                          Get.offAll(const BottomNavBarScreen());
                        } else {
                          Get.showSnackbar(
                              const GetSnackBar(
                                title: "Failed",
                                message: "Check once again before enter your otp",
                                duration: Duration(seconds: 3),
                              )
                          );
                        }
                      },
                      child: const Text("Next"),
                    ),
                  ),
                  child: const CircularProgressIndicator()),
              verticalSpace(24.0),
              GetBuilder<OTPExpireTimerController>(
                builder: (timerController) {
                  return RichText(
                    text: TextSpan(
                      text: "This code will expire in ",
                      style: const TextStyle(fontSize: 13, color: colorGray),
                      children: [
                        TextSpan(
                          text: " ${timerController.duration.inSeconds} s",
                          style: const TextStyle(
                            color: colorPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              ),
              verticalSpace(2.0),
              TextButton(
                  onPressed: () {
                    Get.find<OTPExpireTimerController>().resetCountDown();
                  },
                  child: const Text(
                    "Resend Code",
                    style: TextStyle(color: colorGray),
                  ))
            ],
          ),
        );
      }),
    );
  }
}
