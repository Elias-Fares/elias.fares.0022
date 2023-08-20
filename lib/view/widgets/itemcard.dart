import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/core/function/sizedboxext.dart';
import '../../core/consatnt/appcolors.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.name,
    required this.details,
    required this.cost,
    required this.pc,
    required this.image, this.onTap,

  });

  final String name;
  final String details;
  final String cost;
  final PageController pc;
  final Widget image;
  final  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: InkWell(
        hoverColor: Colors.transparent,
        onTap: this.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(40.r),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(95, 202, 184, 184),
                  blurRadius: 7,
                  spreadRadius: 4,
                  offset: Offset(0, 6))
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                this.image,
                10.h.ph,
                Text(
                  this.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 27.sp),
                ),
                5.h.ph,
                Text(
                  this.cost + " €",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25.sp,
                      color: AppColors.green),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
