import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/data/model/category_model.dart';

List<CategoryModel> categories = [
  CategoryModel(
    image: Image.asset('assets/images/shawarma.png', width: 65.sp),
  ),
  CategoryModel(
    image: SvgPicture.asset('assets/images/barbecue.svg', width: 65.sp),
  ),
  CategoryModel(
    image: Image.asset(
      'assets/images/shawarma_meat.png',
      width: 65.sp,
    ),
  ),
  CategoryModel(
    image: SvgPicture.asset(
      'assets/images/pizza.svg',
      width: 65.sp,
    ),
  ),
  CategoryModel(
    image: Image.asset(
      'assets/images/salad.png',
      width: 65.sp,
    ),
  ),
  CategoryModel(
    image: Image.asset(
      'assets/images/soda.png',
      width: 65.sp,
    ),
  ),
  CategoryModel(
    image: Image.asset(
      'assets/images/chicken-leg.png',
      width: 65.sp,
    ),
  ),
  CategoryModel(
    image: Image.asset(
      'assets/images/falafel.png',
      width: 65.sp,
    ),
  ),
  CategoryModel(
    image: Image.asset(
      'assets/images/rice.png',
      width: 65.sp,
    ),
  ),
  CategoryModel(
    image: SvgPicture.asset(
      'assets/images/chicken.svg',
      width: 65.sp,
    ),
  ),
];
