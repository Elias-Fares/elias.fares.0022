import 'package:get/get.dart';
import 'dart:async';

class MyWaitingController extends GetxController {
  bool isPaused = false;
  int counter = 0;

  static const oneSec = const Duration(seconds: 1);

  void changeState() {
    Timer.periodic(oneSec, (timer) {
      counter++;
      print(counter.toString());
      if (counter == 30) {
        isPaused = true;
        timer.cancel();
        print("Paused");
      }
    });
  }
}
