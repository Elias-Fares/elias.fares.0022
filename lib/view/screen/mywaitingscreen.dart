import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controller/mywaitingcontroller.dart';

class MyWaiting extends StatelessWidget {
  const MyWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    MyWaitingController controller = Get.put(MyWaitingController());
    return Scaffold(
      body: Center(child: InkWell(
        child: Text("Press here"),
        onTap: () {
          controller.changeState();
        },
      ),) ,
    );
  }
}