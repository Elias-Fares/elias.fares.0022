// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:my_app/core/function/sizedboxext.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import '../../core/consatnt/appcolors.dart';

// class ItemCard extends StatelessWidget {
//   const ItemCard({
//     super.key, required this.name, required this.details, required this.cost, required this.pc,
//   });

//   final String name;
//   final String details;
//   final String cost;
//   final PageController pc;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//       child: InkWell(
//         hoverColor: Colors.transparent,
//         onTap: () {
//           Get.defaultDialog(
//               title: name,
//               titleStyle: TextStyle(
//                   fontSize: 40.sp,
//                   color: AppColors.black,
//                   fontWeight: FontWeight.bold),
//               actions: [
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.4,
//                   height: MediaQuery.of(context).size.height * 0.5,
//                   child: PageView(
//                     controller: this.pc,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(15),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(40.r),
//                           child: Image.asset(
//                             'assets/images/bigpizza.png',
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Text("data")
//                     ],
//                   ),
//                 ),
//                 SmoothPageIndicator(
//                   controller: this.pc,
//                   count: 2,
//                   axisDirection: Axis.horizontal,
//                   effect: ExpandingDotsEffect(
//                     dotWidth: 8,
//                     dotHeight: 8,
//                     spacing: 4,
//                     expansionFactor: 4,
//                     dotColor: Colors.grey,
//                     activeDotColor: AppColors.orange,
//                   ),
//                 ),
//                 30.h.ph
//               ]);
//         },
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(40.r),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Color.fromARGB(95, 202, 184, 184),
//                       blurRadius: 7,
//                       spreadRadius: 4,
//                       offset: Offset(0, 6))
//                 ],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(40.r),
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       'assets/images/bigpizza.png',
//                       fit: BoxFit.fitWidth,
//                     ),
//                     10.h.ph,
//                     Text(this.name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 27.sp),),
//                     5.h.ph,
//                     Text(this.cost + " €", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25.sp, color: AppColors.green),),

                    
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
