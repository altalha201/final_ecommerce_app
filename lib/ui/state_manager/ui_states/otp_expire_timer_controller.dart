import 'dart:async';

import 'package:get/get.dart';

class OTPExpireTimerController extends GetxController {
  Timer? countdownTimer;
  Duration _expireDuration = const Duration(seconds: 120);

  Duration get duration => _expireDuration;

  void startCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final seconds = _expireDuration.inSeconds - 1;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        _expireDuration = Duration(seconds: seconds);
      }
      update();
    });
  }

  void resetCountDown() {
    countdownTimer!.cancel();
    _expireDuration = const Duration(seconds: 120);
    startCountdown();
  }
}