import 'package:final_ecommerce_app/ui/state_manager/user_states/cache_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/application_colors.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      Get.find<CacheController>().isLoggedIn().then((value) {

      });
      Get.off(const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SvgPicture.asset(
                "assets/images/logo.svg",
                width: 150,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircularProgressIndicator(
                  color: colorPrimary,
                ),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    "Version 1.0",
                    style: TextStyle(
                        fontSize: 12, color: colorGray, letterSpacing: 0.6),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
