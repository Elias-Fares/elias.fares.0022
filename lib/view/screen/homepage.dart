import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_app/controller/homapage_controller.dart';
import 'package:my_app/core/function/datasearch.dart';
import 'package:my_app/core/function/sizedboxext.dart';
import 'package:my_app/core/consatnt/appcolors.dart';
import 'package:my_app/network/api%20handling/mywidget.dart';
import 'package:my_app/view/widgets/category.dart';
import 'package:my_app/view/widgets/myappbar.dart';
import '../widgets/itemcard.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: MyAppbar(
              ontap: () {
                controller.search(context);
              },
            ),
            preferredSize: Size(double.infinity, 300)),
        body: SafeArea(
          child: GetBuilder<HomePageController>(
            builder: (controller) => MyWidget(
              state: controller.bodyStatus.value,
              onSuccess: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "4".tr,
                      style: TextStyle(
                          fontSize: 23.sp, fontWeight: FontWeight.w500),
                    ),
                    10.h.ph,
                    Text(
                      "5".tr,
                      style: TextStyle(
                          fontSize: 23.sp, fontWeight: FontWeight.w500),
                    ),
                    16.h.ph,
                    Container(
                      height: 140.h,
                      // this listview for category
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.itemModel == null
                            ? 0
                            : controller.itemModel!.data.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0)
                            return MyCategory(
                              controller: controller,
                              // this was all
                              name: "2".tr,

                              image: Image.asset(
                                'assets/images/all.png',
                                width: 75.w,
                              ),
                              pageNumber: index,
                            );
                          else
                            return MyCategory(
                              controller: controller,
                              image: MyWidget(
                                state: controller.bodyStatus.value,
                                onSuccess: Image.network(
                                  "http://timeengcom.com/resturant" +
                                      controller
                                          .itemModel!.data[index - 1].image,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Center(),
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;

                                    return CircularProgressIndicator(
                                      color: AppColors.green,
                                    );
                                  },
                                  fit: BoxFit.cover,
                                  height: 80.h,
                                ),
                              ),
                              name: controller.itemModel == null
                                  ? "null"
                                  : controller.itemModel!.data[index - 1].name
                                      .toString(),
                              pageNumber: index,
                            );
                        },
                      ),
                    ),
                    10.h.ph,
                    // this list view for topshow
                    Container(
                      height: 115.h,
                      color: AppColors.transparentGreen,
                      child: ListView.builder(
                        controller: controller.sc,
                        itemCount: controller.activeMeals.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index1) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          child: Center(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(40.r),
                              onTap: () {
                                // Dialog
                                Get.defaultDialog(
                                    title: controller.getName(
                                        controller.activeMeals[index1]),
                                    middleText: controller.getDetails(
                                        controller.activeMeals[index1]),
                                    titleStyle: TextStyle(
                                        fontSize: 40.sp,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold),
                                    actions: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        child: PageView.builder(
                                          controller: controller.pc2,
                                          itemCount: controller
                                              .getImages(controller
                                                  .activeMeals[index1])
                                              .length,
                                          itemBuilder: (context, index) =>
                                              Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(40.r),
                                                child: Image.network(
                                                  "http://timeengcom.com/resturant" +
                                                      controller.getImages(
                                                          controller
                                                                  .activeMeals[
                                                              index1])[index],
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Center(),
                                                  loadingBuilder: (context,
                                                          child,
                                                          loadingProgress) =>
                                                      Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: AppColors.green,
                                                    ),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ),
                                      // SmoothPageIndicator(
                                      //   controller: controller.pc2,
                                      //   count: controller
                                      //       .getImages(
                                      //           controller.activeMeals[index1])
                                      //       .length,
                                      //   axisDirection: Axis.horizontal,
                                      //   effect: ExpandingDotsEffect(
                                      //     dotWidth: 8,
                                      //     dotHeight: 8,
                                      //     spacing: 4,
                                      //     expansionFactor: 4,
                                      //     dotColor: Colors.grey,
                                      //     activeDotColor: AppColors.orange,
                                      //   ),
                                      // ),
                                      30.h.ph
                                    ]);
                              },
                              child: Container(
                                width: 220.w,
                                height: 120.h,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.green,
                                        width: 1.2,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(40.r)),
                                child: Center(
                                    child: Text(
                                  controller
                                      .getName(controller.activeMeals[index1]),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    10.h.ph,
                    // this pageview is for items
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: PageView.builder(
                        controller: controller.pc,
                        itemCount: controller.itemModel == null
                            ? 0
                            : controller.itemModel!.data.length + 1,
                        itemBuilder: (context, pvIndex) {
                          if (pvIndex == 0) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.width * 0.3,
                                child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          (MediaQuery.of(context).size.width <
                                                  960)
                                              ? 3
                                              : 4,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20,
                                    ),
                                    itemCount: controller.names.length,
                                    itemBuilder: (context, gridIndex) =>
                                        ItemCard(
                                          onTap: () {
                                            Get.defaultDialog(
                                                title: controller.getName(
                                                    controller
                                                        .names[gridIndex]),
                                                middleText: controller
                                                    .getDetails(controller
                                                        .names[gridIndex])
                                                    .toString(),
                                                titleStyle: TextStyle(
                                                    fontSize: 40.sp,
                                                    color: AppColors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                actions: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.5,
                                                    child: PageView.builder(
                                                      controller:
                                                          controller.pc2,
                                                      itemCount: controller
                                                          .getImages(controller
                                                              .names[gridIndex])
                                                          .length,
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15),
                                                        child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.r),
                                                            child:
                                                                Image.network(
                                                              "http://timeengcom.com/resturant" +
                                                                  controller.getImages(
                                                                      controller
                                                                              .names[
                                                                          gridIndex])[index],
                                                              errorBuilder:
                                                                  (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Center(),
                                                              loadingBuilder:
                                                                  (context,
                                                                          child,
                                                                          loadingProgress) =>
                                                                      Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color:
                                                                      AppColors
                                                                          .green,
                                                                ),
                                                              ),
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  // SmoothPageIndicator(
                                                  //   controller: controller.pc2,
                                                  //   count: controller
                                                  //       .getImages(
                                                  //           controller.activeMeals[index1])
                                                  //       .length,
                                                  //   axisDirection: Axis.horizontal,
                                                  //   effect: ExpandingDotsEffect(
                                                  //     dotWidth: 8,
                                                  //     dotHeight: 8,
                                                  //     spacing: 4,
                                                  //     expansionFactor: 4,
                                                  //     dotColor: Colors.grey,
                                                  //     activeDotColor: AppColors.orange,
                                                  //   ),
                                                  // ),
                                                  30.h.ph
                                                ]);
                                          },
                                          name: controller.getName(
                                              controller.names[gridIndex]),
                                          cost: controller.getCost(
                                              controller.names[gridIndex]),
                                          details: controller.getDetails(
                                              controller.names[gridIndex]),
                                          pc: controller.pc2,
                                          image: controller
                                                  .getImages(controller
                                                      .names[gridIndex])
                                                  .isEmpty
                                              ? Image.asset(
                                                  "assets/images/bigpizza.png",
                                                )
                                              : Image.network(
                                                  "http://timeengcom.com/resturant" +
                                                      controller
                                                          .getImages(
                                                              controller.names[
                                                                  gridIndex])[0]
                                                          .toString(),
                                                  // height: ,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Center(),
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
                                                    if (loadingProgress == null)
                                                      return child;
                                                    return Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: AppColors.green,
                                                      ),
                                                    );
                                                  }),
                                        )),
                              ),
                            );
                          } else
                            return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40.w),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          (MediaQuery.of(context).size.width <
                                                  960)
                                              ? 3
                                              : 4,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20,
                                    ),
                                    itemCount: controller.itemModel
                                        ?.data[pvIndex - 1].items.length,
                                    itemBuilder: (context, gridIndex) =>
                                        ItemCard(
                                      onTap: () {
                                        Get.defaultDialog(
                                            title: controller.itemModel == null
                                                ? "null"
                                                : controller
                                                    .itemModel!
                                                    .data[pvIndex - 1]
                                                    .items[gridIndex]
                                                    .name
                                                    .toString(),
                                            middleText:
                                                controller.itemModel == null
                                                    ? "null"
                                                    : controller
                                                        .itemModel!
                                                        .data[pvIndex - 1]
                                                        .items[gridIndex]
                                                        .details
                                                        .toString(),
                                            titleStyle: TextStyle(
                                                fontSize: 40.sp,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.bold),
                                            actions: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.5,
                                                child: PageView.builder(
                                                  controller: controller.pc2,
                                                  itemCount:
                                                      controller.itemModel ==
                                                              null
                                                          ? 0
                                                          : controller
                                                              .itemModel!
                                                              .data[pvIndex - 1]
                                                              .items[gridIndex]
                                                              .photos
                                                              .length,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.r),
                                                        child: Image.network(
                                                          "http://timeengcom.com/resturant" +
                                                              controller
                                                                  .itemModel!
                                                                  .data[
                                                                      pvIndex -
                                                                          1]
                                                                  .items[
                                                                      gridIndex]
                                                                  .photos[index]
                                                                  .image
                                                                  .toString(),
                                                          // controller.itemModel == null ? "" : controller.itemModel!.data[pvIndex - 1].items[gridIndex].photos[index].toString(),
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Center(),
                                                          loadingBuilder: (context,
                                                                  child,
                                                                  loadingProgress) =>
                                                              Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: AppColors
                                                                  .green,
                                                            ),
                                                          ),
                                                        )),
                                                  ),
                                                ),
                                              ),
                                              // SmoothPageIndicator(
                                              //   controller: controller.pc2,
                                              //   count: controller
                                              //       .getImages(
                                              //           controller.activeMeals[index1])
                                              //       .length,
                                              //   axisDirection: Axis.horizontal,
                                              //   effect: ExpandingDotsEffect(
                                              //     dotWidth: 8,
                                              //     dotHeight: 8,
                                              //     spacing: 4,
                                              //     expansionFactor: 4,
                                              //     dotColor: Colors.grey,
                                              //     activeDotColor: AppColors.orange,
                                              //   ),
                                              // ),
                                              30.h.ph
                                            ]);
                                      },
                                      image: controller
                                              .itemModel!
                                              .data[pvIndex - 1]
                                              .items[gridIndex]
                                              .photos
                                              .isEmpty
                                          ? Image.asset(
                                              "assets/images/bigpizza.png")
                                          : Image.network(
                                              "http://timeengcom.com/resturant" +
                                                  controller
                                                      .itemModel!
                                                      .data[pvIndex - 1]
                                                      .items[gridIndex]
                                                      .photos
                                                      .first
                                                      .image
                                                      .toString(),
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Center(),
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: AppColors.green,
                                                  ),
                                                );
                                              }),
                                      name: controller.itemModel == null
                                          ? "null"
                                          : controller
                                              .itemModel!
                                              .data[pvIndex - 1]
                                              .items[gridIndex]
                                              .name
                                              .toString(),
                                      cost: controller.itemModel == null
                                          ? "null"
                                          : controller
                                              .itemModel!
                                              .data[pvIndex - 1]
                                              .items[gridIndex]
                                              .cost
                                              .toString(),
                                      details: controller.itemModel == null
                                          ? "null"
                                          : controller
                                              .itemModel!
                                              .data[pvIndex - 1]
                                              .items[gridIndex]
                                              .details
                                              .toString(),
                                      pc: controller.pc2,
                                    ),
                                  ),
                                ));
                        },
                        onPageChanged: (value) {
                          controller.changSelectedPage(value);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
