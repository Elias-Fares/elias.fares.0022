import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_app/controller/homapage_controller.dart';
import 'package:my_app/core/function/datasearch.dart';
import 'package:my_app/core/function/sizedboxext.dart';
import 'package:my_app/view/widgets/langbtn.dart';
import '../../core/consatnt/appcolors.dart';
import 'package:lottie/lottie.dart';

class MyAppbar extends GetView<HomePageController> {
  const MyAppbar({
    required this.ontap,
    super.key,
  });

  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        40.w.pw,
        Image.asset(
          'assets/images/logo-balon.png',
          width: 300.w,
        ),
        40.w.pw,
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          onTap: this.ontap,
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.yellow, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              width: 850.w,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Row(
                  children: [
                    20.w.pw,
                    Text(
                      "1".tr,
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              )),
        ),
        100.w.pw,
        LangBtn(
          text: "Ar",
          onTap: () {
            if (controller.bodyStatus.value != "loading"){
              controller.changeLanguage("ar");
            }
          },
        ),
        30.w.pw,
        LangBtn(
          text: "En",
          onTap: () {
            if (controller.bodyStatus.value != 'loading'){
              controller.changeLanguage("en");
            }
          },
        ),
        30.w.pw,
        LangBtn(
          text: "Dw",
          onTap: () {
            if (controller.bodyStatus.value != 'loading'){
              controller.changeLanguage("dw");
            }
          },
        ),
        Spacer(),
        InkWell(
          child: Icon(
            Icons.power_settings_new_outlined,
            color: Color.fromARGB(255, 235, 182, 179),
          ),
          onTap: () {
            Get.dialog(Material(
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  // width: double.infinity,
                  // height: double.infinity,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo-balon.png',
                        width: 800.w,
                      ),
                      Lottie.asset('assets/images/waitingscreen.json', height: 400.h)
                    ],
                  ),
                ),
              ),
            ));
          },
        ),
        40.w.pw,
      ]),
    );
  }
}
