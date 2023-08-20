import 'package:flutter/material.dart';
import 'package:my_app/core/function/datasearch.dart';
import 'package:my_app/view/widgets/myappbar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyMytest extends StatelessWidget {
  const MyMytest({super.key});

  @override
  Widget build(BuildContext context) {
    // HomePageController controller = Get.put(HomePageController());
    return Scaffold(
      appBar: PreferredSize(
          child: MyAppbar(
            ontap: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
          preferredSize: Size(double.infinity, 200)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            "https://th.bing.com/th/id/R.7472b775bf44b2e171d6db312df00413?rik=vwg%2bUpBQ19w7xQ&pid=ImgRaw&r=0",
            errorBuilder: (context, error, stackTrace) => Text("not found"),
            loadingBuilder: (context, child, loadingProgress) =>
                Text("loading..............."),
          ),
          // NetworkImage("https://th.bing.com/th/id/OIP.Zc3EGC08urKtNTEXt9JvmwHaHj?pid=ImgDet&rs=1")
          CachedNetworkImage(
              imageUrl:
                  "https://th.bing.com/th/id/R.7472b775bf44b2e171d6db312df00413?rik=vwg%2bUpBQ19w7xQ&pid=ImgRaw&r=0",
                  
                  )
        ],
      ),
    );
  }
}
