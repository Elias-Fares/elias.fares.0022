import 'package:get/get.dart';
import 'package:my_app/controller/homapage_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}
