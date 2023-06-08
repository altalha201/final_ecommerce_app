import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_manager/user_states/cache_controller.dart';
import '../state_manager/user_states/user_profile_controller.dart';
import '../utils/application_colors.dart';
import '../widgets/space.dart';
import 'bottom_nav_bar_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final TextEditingController _firstNameET = TextEditingController();
  final TextEditingController _lastNameET = TextEditingController();
  final TextEditingController _shippingAddressET = TextEditingController();

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
              Get.find<CacheController>().clearUserData();
              Get.offAll(const BottomNavBarScreen());
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
                      "${CacheController.profileData?.firstName} ${CacheController.profileData?.lastName}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${CacheController.profileData?.email}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: updateName,
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
                    initialValue: CacheController.profileData?.shippingAddress,
                    decoration: const InputDecoration(
                        disabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: colorBlack))),
                  ),
                ),
                IconButton(
                    onPressed: updateShippingAddress,
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

  void updateName() {
    _firstNameET.text =
        CacheController.profileData?.firstName ?? "";
    _lastNameET.text =
        CacheController.profileData?.lastName ?? "";
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
            controller: _firstNameET,
            decoration:
            const InputDecoration(hintText: "First Name"),
          ),
          verticalSpace(8.0),
          TextFormField(
            controller: _lastNameET,
            decoration:
            const InputDecoration(hintText: "Last Name"),
          ),
          verticalSpace(8.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await Get.find<UserProfileController>().completeProfile({
                  "firstName": _firstNameET.text,
                  "lastName": _lastNameET.text,
                });
                Get.back();
              },
              child: const Text("Update"),
            ),
          )
        ],
      ),
    ));
  }

  void updateShippingAddress() {
    _shippingAddressET.text = CacheController.profileData?.shippingAddress ?? "";

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
            controller: _shippingAddressET,
            maxLines: 5,
            decoration: const InputDecoration(hintText: "Shipping Address"),
          ),
          verticalSpace(8.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await Get.find<UserProfileController>().completeProfile({
                  "shippingAddress": _shippingAddressET.text,
                });
                Get.back();
              },
              child: const Text("Update"),
            ),
          )
        ],
      ),
    ));
  }
}
