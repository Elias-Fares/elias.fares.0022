import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/controller/homapage_controller.dart';
import '../../core/consatnt/appcolors.dart';

class MyCategory extends StatelessWidget {
  final HomePageController controller;
  final int? pageNumber;
  final Widget? image;
  final String? name;
  const MyCategory({
    super.key,
    required this.controller,
    this.pageNumber,
    this.image,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Material(
        color: controller.selectedPage == pageNumber
            ? AppColors.transparentGreen
            : AppColors.transparentYellow,
        borderRadius: BorderRadius.circular(40.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(40.r),
          child: Container(
            width: 190.w,
            decoration: BoxDecoration(
                border: controller.selectedPage == pageNumber
                    ? Border.all(width: 1, color: AppColors.green)
                    : Border.all(width: 1, color: Colors.transparent),
                borderRadius: BorderRadius.circular(40.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: AppColors.shadowColor,
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: Offset(0, 10))
                    ]),
                    child: image),
                Text(
                  name!,
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black),
                )
              ],
            ),
          ),
          onTap: () {
            controller.gotopage(pageNumber!);
          },
        ),
      ),
    );
  }
}
