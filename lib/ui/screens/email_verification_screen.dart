import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_manager/user_states/user_auth_controller.dart';
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
  final TextEditingController _emailETController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserAuthController>(builder: (authController) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _fromKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TitleWidgets(
                    title: "Welcome Back",
                    subtitle: "Please Enter Your Email Address"),
                TextFormField(
                  controller: _emailETController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Email Address",
                  ),
                  validator: (String? value) {
                    if ((value?.isEmpty ?? true) ||
                        (!EmailValidator.validate(value ?? ""))) {
                      return "Enter a valid Email";
                    }
                    return null;
                  },
                ),
                verticalSpace(16.0),
                Visibility(
                  visible: authController.emailVerificationInProgress,
                  replacement: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_fromKey.currentState!.validate()) {
                          final bool response = await authController
                              .emailVerification(_emailETController.text);
                          if (response) {
                            Get.to(PinVerificationScreen(
                              email: _emailETController.text,
                            ));
                          } else {
                            Get.showSnackbar(const GetSnackBar(
                              title: "Failed",
                              message: "Email Verification Failed. Try again",
                              duration: Duration(seconds: 3),
                            ));
                          }
                        }
                      },
                      child: const Text("Next"),
                    ),
                  ),
                  child: const CircularProgressIndicator(
                    // color: colorPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
