import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_manager/auth_controller.dart';
import '../utils/application_colors.dart';
import '../widgets/space.dart';
import 'bottom_nav_bar_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final TextEditingController firstNameET = TextEditingController();
  final TextEditingController lastNameET = TextEditingController();
  final TextEditingController shippingAddressET = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        leading: const BackButton(
          color: colorGray,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.find<AuthController>().clearUserData().then((value) {
                Get.offAll(const BottomNavBarScreen());
              });
            },
            child: const Text("Logout"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: colorGray.withOpacity(0.4),
                  radius: 24,
                  child: const Icon(
                    Icons.person_outline,
                    size: 32,
                    color: colorBlack,
                  ),
                ),
                horizontalSpace(16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${AuthController.profileData?.firstName} ${AuthController.profileData?.lastName}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${AuthController.profileData?.email}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      firstNameET.text =
                          AuthController.profileData?.firstName ?? "";
                      lastNameET.text =
                          AuthController.profileData?.lastName ?? "";
                      Get.bottomSheet(Container(
                        height: 250,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          color: colorWhite,
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: firstNameET,
                              decoration:
                                  const InputDecoration(hintText: "First Name"),
                            ),
                            verticalSpace(8.0),
                            TextFormField(
                              controller: lastNameET,
                              decoration:
                                  const InputDecoration(hintText: "Last Name"),
                            ),
                            verticalSpace(8.0),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {

                                  Get.back();
                                },
                                child: const Text("Update"),
                              ),
                            )
                          ],
                        ),
                      ));
                    },
                    icon: const Icon(
                      Icons.edit_outlined,
                      size: 18,
                    )),
              ],
            ),
            verticalSpace(24.0),
            Row(
              children: [
                const Icon(
                  Icons.local_shipping_outlined,
                  size: 28,
                  color: colorBlack,
                ),
                horizontalSpace(16.0),
                Expanded(
                  child: TextFormField(
                    enabled: false,
                    initialValue: AuthController.profileData?.shippingAddress,
                    decoration: const InputDecoration(
                        disabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: colorBlack))),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_outlined,
                      size: 18,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
