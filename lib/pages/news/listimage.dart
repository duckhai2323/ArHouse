import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/news/news_controller.dart';

class ListImage extends GetView<NewsController>{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.only(top: 10,bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child:ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.newsData.images.length-1,
        itemBuilder: (BuildContext context, index){
          return  Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: ClipRRect(
              child: Image(
                image: CachedNetworkImageProvider(controller.newsData.images[index+1]),
                width: MediaQuery.of(context).size.width,
                height: 220,
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}