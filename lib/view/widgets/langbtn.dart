import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/core/consatnt/appcolors.dart';

class LangBtn extends StatelessWidget {
  const LangBtn({super.key, required this.text , required this.onTap});
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.transparentGreen,
        borderRadius: BorderRadius.circular(20.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(40.r),
          child: Container(
            width: 100.w,
            height: 50.h,
            decoration: BoxDecoration(
                border:  Border.all(width: 1, color: AppColors.green),
                    
                borderRadius: BorderRadius.circular(20.r)),
            child: Center(child: Text(this.text, style: TextStyle(fontSize: 26.sp),))
          ),
          onTap: this.onTap
        ),
      );
  }
}