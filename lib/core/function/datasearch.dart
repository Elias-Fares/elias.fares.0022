import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_app/controller/homapage_controller.dart';
import 'package:my_app/core/consatnt/appcolors.dart';
import 'package:my_app/core/function/sizedboxext.dart';

import '../../view/widgets/itemcard.dart';

HomePageController controller = Get.find();

class DataSearch extends SearchDelegate {
  // List names = controller.searchList(controller.names);
  @override
  String? get searchFieldLabel => "1".tr;
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData = Theme.of(context);
    return ThemeData.copyWith(
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.2, color: AppColors.green, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(50.r)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.2,
                  color: AppColors.orange,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(50.r)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.2,
                  color: AppColors.yellow,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(50.r)),
        ),
        appBarTheme: AppBarTheme(
          toolbarHeight: 100.h,
          color: AppColors.transparentGreen,
          elevation: 0,
        ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Center(
          child: Text(
        "3".tr,
        style: TextStyle(
            fontSize: 26.sp,
            color: AppColors.black,
            fontWeight: FontWeight.w400),
      ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.black,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (controller) => GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: query == ""
            ? controller.names.length
            : controller.namesAfterSearch.length,
        itemBuilder: (context, index1) => ItemCard(
          onTap: () {
            Get.defaultDialog(
                title: controller.getName(controller.namesAfterSearch[index1]),
                middleText:
                    controller.getDetails(controller.namesAfterSearch[index1]),
                titleStyle: TextStyle(
                    fontSize: 40.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold),
                actions: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: PageView.builder(
                      controller: controller.pc2,
                      itemCount: controller
                          .getImages(controller.namesAfterSearch[index1])
                          .length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(15),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.r),
                            child: Image.network(
                                "http://timeengcom.com/resturant" +
                                    controller.getImages(controller
                                        .namesAfterSearch[index1])[index],
                                errorBuilder: (context, error, stackTrace) =>
                                    Center(
                                      child: Text("Error"),
                                    ),
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.green,
                                    ),
                                  );
                                })),
                      ),
                    ),
                  ),
                  30.h.ph
                ]);
          },
          name: query == ""
              ? controller.getName(controller.names[index1])
              : controller.getName(controller.namesAfterSearch[index1]),
          cost: query == ""
              ? controller.getCost(controller.names[index1])
              : controller.getCost(controller.namesAfterSearch[index1]),
          details: '',
          pc: controller.pc2,
          image: query == ""
              ? controller.getImages(controller.names[index1]).isEmpty
                  ? Image.asset("assets/images/bigpizza.png")
                  : Image.network(
                      "http://timeengcom.com/resturant" +
                          controller
                              .getImages(controller.names[index1])
                              .first
                              .toString(),
                      errorBuilder: (context, error, stackTrace) => Center(
                            child: Text("Error"),
                          ),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.green,
                          ),
                        );
                      })
              : controller
                      .getImages(controller.namesAfterSearch[index1])
                      .isEmpty
                  ? Image.asset("assets/images/bigpizza.png")
                  : Image.network(
                      "http://timeengcom.com/resturant" +
                          controller
                              .getImages(controller.namesAfterSearch[index1])
                              .first
                              .toString(),
                      errorBuilder: (context, error, stackTrace) => Center(
                            child: Text("Error"),
                          ),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.green,
                          ),
                        );
                      }),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    controller.namesAfterSearch = controller.searching(controller.names, query);
    return GetBuilder<HomePageController>(
      builder: (controller) => GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: query == ""
            ? controller.names.length
            : controller.namesAfterSearch.length,
        itemBuilder: (context, index) => ItemCard(
          onTap: () {
            Get.defaultDialog(
                title: query == ""
                    ? controller.getName(controller.names[index])
                    : controller.getName(controller.namesAfterSearch[index]),
                middleText: query == ""
                    ? controller.getDetails(controller.names[index])
                    : controller.getDetails(controller.namesAfterSearch[index]),
                titleStyle: TextStyle(
                    fontSize: 40.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold),
                actions: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: PageView.builder(
                      controller: controller.pc2,
                      itemCount:
                          controller.getImages(controller.names[index]).length,
                      itemBuilder: (context, index1) => Padding(
                        padding: const EdgeInsets.all(15),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.r),
                            child: query == ""
                                ? Image.network(
                                    "http://timeengcom.com/resturant" +
                                        controller.getImages(
                                            controller.names[index])[index1],
                                    errorBuilder:
                                        (context, error, stackTrace) => Center(
                                              child: Text("Error"),
                                            ),
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.green,
                                        ),
                                      );
                                    })
                                : Image.network(
                                    "http://timeengcom.com/resturant" +
                                        controller.getImages(controller
                                            .namesAfterSearch[index])[index1],
                                    errorBuilder:
                                        (context, error, stackTrace) => Center(
                                              child: Text("Error"),
                                            ),
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.green,
                                        ),
                                      );
                                    })),
                      ),
                    ),
                  ),
                  30.h.ph
                ]);
          },
          name: query == ""
              ? controller.getName(controller.names[index])
              : controller.getName(controller.namesAfterSearch[index]),
          cost: query == ""
              ? controller.getCost(controller.names[index])
              : controller.getCost(controller.namesAfterSearch[index]),
          details: query == ""
              ? controller.getDetails(controller.names[index])
              : controller.getDetails(controller.namesAfterSearch[index]),
          image: query == ""
              ? controller.getImages(controller.names[index]).isEmpty
                  ? Image.asset("assets/images/bigpizza.png")
                  : Image.network(
                      "http://timeengcom.com/resturant" +
                          controller
                              .getImages(controller.names[index])
                              .first
                              .toString(),
                      errorBuilder: (context, error, stackTrace) => Center(
                            child: Text("Error"),
                          ),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.green,
                          ),
                        );
                      })
              : controller.getImages(controller.namesAfterSearch[index]).isEmpty
                  ? Image.asset("assets/images/bigpizza.png")
                  : Image.network(
                      "http://timeengcom.com/resturant" +
                          controller
                              .getImages(controller.namesAfterSearch[index])
                              .first
                              .toString(),
                      errorBuilder: (context, error, stackTrace) => Center(
                            child: Text("Error"),
                          ),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.green,
                          ),
                        );
                      }),
          pc: controller.pc2,
        ),
      ),
    );
  }
}
