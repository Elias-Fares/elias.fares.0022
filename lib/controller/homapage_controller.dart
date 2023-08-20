import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/core/function/datasearch.dart';
import '../model/itemmodel.dart';
import '../network/api handling/api_provider.dart';


class HomePageController extends GetxController with StateMixin<ItemModel>{
// pages
  int selectedPage = 0;
  PageController pc = PageController(initialPage: 0);
  PageController pc2 = PageController(initialPage: 0);

//  Api
  String pageUrl = "http://timeengcom.com/resturant/categories/?language=dw";
  ApiProvider _apiProvider = ApiProvider();
  ItemModel? itemModel;
  RxString bodyStatus = 'done'.obs;
  RxString buttonLoading = 'done'.obs;
  RxString ImageStatus = 'done'.obs;
// auto scroll

  ScrollController sc = ScrollController();

  scrollToLeft() {
    sc.jumpTo(sc.position.maxScrollExtent);
  }
//----------------------------------//

  void changSelectedPage(int x) {
    selectedPage = x;
    update();
  }

  void gotopage(int x) {
    pc.animateToPage(x,
        duration: Duration(milliseconds: 200), curve: Curves.linear);
  }

  Future<dynamic> getAllData() async {
    print('start');
    bodyStatus.value = 'loading';

    final response = await _apiProvider.gets<Map<String, dynamic>, ItemModel>(
      pageUrl,
      headers: {},
      makingTheFromJsonPossible: (theComingJson) {
        itemModel = ItemModel.fromJson(theComingJson);
        return itemModel!;
      },
    );
    handleRespose(response);
    searchList(names);
    makeTopShow();
    update();
  }

  handleRespose(response) {
    if (response == 'error') {
      bodyStatus.value = 'error';
    } else {
      bodyStatus.value = 'done';
      return response;
    }
    return response;
  }

  void changeLanguage(String lang) {
    if (lang == "en") {
      pageUrl = "http://timeengcom.com/resturant/categories/?language=en";
      changeAppLang('en');
    }
    if (lang == "ar") {
      pageUrl = "http://timeengcom.com/resturant/categories/?language=ar";
      changeAppLang('ar');
    }
    if (lang == "dw") {
      pageUrl = "http://timeengcom.com/resturant/categories/?language=dw";
      changeAppLang('dw');
    }
    selectedPage = 0;
    names = [];
    namesAfterSearch = [];
    getAllData();
    update();
  }

  // ----------------------------------------------SEARCH SECTION-------------------------------------//

  List<Item> names = [];
  List<Item> namesAfterSearch = [];

  //the below function is used to show dataSearch

  void search(BuildContext x) {
    showSearch(context: x, delegate: DataSearch());
    // the below call is to make suggestion list when showseach is called, this suggestion list which is name contain all the items
    // this call is to replace the first list (commented) in datasearch.dart
    // i make if statement because its important here, dont be CURIOS man!!
    if (names.isEmpty) searchList(names);
  }

  //this function is used to deduce items from the entire response and make a suggestion list contain all the items

  List searchList(List x) {
    itemModel!.data.forEach((element) {
      element.items.forEach((element) {
        x.add(element);
      });
    });
    return x;
  }

  // this function secrch in name

  List<Item> searching(List<Item> x, String query) {
    x = names
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return x;
  }

  String getName(Item i) {
    return i.name;
  }

  String getCost(Item i) {
    return i.cost.toString();
  } 

  String getDetails(Item i) {
    return i.details.toString();
  }

  List getImages(Item i) {
    List x = [];
    i.photos.forEach((element) {x.add(element.image); });
    return x;
  }

  // -------------------------------------------------------SEARCH SECTION ENDED---------------------------------------//

  // Top Show
  List<Item> activeMeals = [];
  void makeTopShow() {
    activeMeals = names.where((element) => (!element.active)).toList();
  }

  // localization

  Locale? Language;
  changeAppLang(String langcode) {
    Language = Locale(langcode);
    Get.updateLocale(Language!);
  }

  @override
  void onInit() {
    changeAppLang('dw');
    getAllData();
    super.onInit();
  }

  @override
  void dispose() {
    pc.dispose();
    pc2.dispose();
    selectedPage = 0;
    super.dispose();
  }









String? imageLink (Item _item){
  
}



}
