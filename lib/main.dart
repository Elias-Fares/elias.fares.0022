import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/binding/mybinding.dart';
import 'package:get/get.dart';
import 'package:my_app/core/consatnt/translation.dart';
import 'package:my_app/view/screen/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1920, 987),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        initialBinding: MyBinding(),
        translations: MyTranslation(),
      ),
    );
  }
}
