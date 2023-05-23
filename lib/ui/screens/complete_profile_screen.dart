import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_manager/user_profile_controller.dart';
import '../widgets/space.dart';
import '../widgets/title_widgets.dart';
import 'bottom_nav_bar_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final GlobalKey<FormState> _completeKey = GlobalKey<FormState>();

  final TextEditingController _firstNameET = TextEditingController();
  final TextEditingController _lastNameET = TextEditingController();
  final TextEditingController _mobileET = TextEditingController();
  final TextEditingController _cityET = TextEditingController();
  final TextEditingController _shippingAddressET = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _completeKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const TitleWidgets(
                        title: "Complete Profile",
                        subtitle: "Get started with us with your details"),
                    TextFormField(
                      controller: _firstNameET,
                      decoration: const InputDecoration(
                        hintText: "First Name",
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter Your first name";
                        }
                        return null;
                      },
                    ),
                    verticalSpace(8.0),
                    TextFormField(
                      controller: _lastNameET,
                      decoration: const InputDecoration(
                        hintText: "Last Name",
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter Your last name";
                        }
                        return null;
                      },
                    ),
                    verticalSpace(8.0),
                    TextFormField(
                      controller: _mobileET,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: "Mobile",
                      ),
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter Your phone number";
                        }
                        return null;
                      },
                    ),
                    verticalSpace(8.0),
                    TextFormField(
                      controller: _cityET,
                      decoration: const InputDecoration(
                        hintText: "City",
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter Your City";
                        }
                        return null;
                      },
                    ),
                    verticalSpace(8.0),
                    TextFormField(
                      controller: _shippingAddressET,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        hintText: "Shipping Address",
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter Your Shipping Address";
                        }
                        return null;
                      },
                    ),
                    verticalSpace(16.0),
                    GetBuilder<UserProfileController>(
                        builder: (profileController) {
                      return Visibility(
                        visible: profileController.profileCompleteInProgress,
                        replacement: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_completeKey.currentState!.validate()) {
                                Map<String, String> requestBody = {
                                  "firstName": _firstNameET.text,
                                  "lastName": _lastNameET.text,
                                  "mobile": _mobileET.text.trim(),
                                  "city": _cityET.text,
                                  "shippingAddress": _shippingAddressET.text
                                };

                                final response = await profileController
                                    .completeProfile(requestBody);
                                if (response) {
                                  Get.offAll(const BottomNavBarScreen());
                                } else {
                                  Get.showSnackbar(const GetSnackBar(
                                    title: "Failed",
                                    message:
                                        "Profile Complete Failed. Try again",
                                    duration: Duration(seconds: 3),
                                  ));
                                }
                              }
                            },
                            child: const Text("Complete"),
                          ),
                        ),
                        child: const CircularProgressIndicator(),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
