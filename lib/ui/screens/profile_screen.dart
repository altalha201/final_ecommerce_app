import 'package:final_ecommerce_app/ui/screens/bottom_nav_bar_screen.dart';
import 'package:final_ecommerce_app/ui/state_manager/auth_controller.dart';
import 'package:final_ecommerce_app/ui/state_manager/user_profile_controller.dart';
import 'package:final_ecommerce_app/ui/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/application_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        leading: const BackButton(
          color: colorGray,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.find<UserProfileController>().getProfileData().then((value) {
                Get.back();
              });
            },
            icon: const Icon(Icons.info_outline),
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
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined, size: 18,)),
              ],
            ),
            verticalSpace(24.0),
            Row(
              children: [
                const Icon(Icons.local_shipping_outlined, size: 28, color: colorBlack,),
                horizontalSpace(16.0),
                Expanded(
                  child: TextFormField(
                    enabled: false,
                    initialValue: AuthController.profileData?.shippingAddress,
                    decoration: const InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 2, color: colorBlack)
                      )
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined, size: 18,)),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<AuthController>().clearUserData().then((value) {
            Get.offAll(const BottomNavBarScreen());
          });
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
