import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/application/application_controller.dart';
import 'package:thietthach_app/pages/news/listimage.dart';
import 'package:thietthach_app/pages/news/listnews.dart';
import 'package:thietthach_app/pages/news/news_controller.dart';

import '../../colors/colors.dart';

class NewsPage extends GetView<NewsController>{

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.delay.isFalse?SafeArea(
      child: Scaffold(
        appBar:AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:AppColors.backgroundColor,
          leading: InkWell(onTap:(){Navigator.pop(context);},child: Icon(Icons.arrow_back_ios, size: 25,color: Colors.black,)),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: Container(
              color: Colors.grey.shade300,
              height: 1,
            ),
          ),
          flexibleSpace: const Center(
            child: Text(
              'News ArHouse',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: CachedNetworkImageProvider(controller.newsData.images[0]),
                width: MediaQuery.of(context).size.width,
                height: 200,
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Text(
                  controller.newsData.title!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Divider(),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                child: Text(
                  controller.newsData.content!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),

              ListImage(),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Text(
                  'ArHouse Group',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Text(
                  '20 nam xay dung sieu to khong lo',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Text(
                  'He thong chi nhanh rong khap the gioi voi nhung du an sieu to khong lo',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Text(
                  'Hotline: 0987897678 - 8765567567',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black
                  ),
                ),
              ),

              const SizedBox(height: 15,),

              Container(
                height: 15,
                width: MediaQuery.sizeOf(context).width,
                color: Color.fromRGBO(244, 244, 244, 1),
              ),

              Container(
                height: 140,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text(
                            'Comments',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            controller.HandleComment();
                          },
                          child: const Text(
                            'See All',
                            style: TextStyle(
                              color: AppColors.backgroundIntro,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        const Icon(Icons.arrow_forward_ios,size: 16,color: AppColors.backgroundIntro,)
                      ],
                    ),

                    const SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                            radius: 23,
                            backgroundImage: CachedNetworkImageProvider(ApplicationController.image),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              controller.HandleComment();
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(left: 15,top: 10,bottom: 15),
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color.fromRGBO(244, 244, 244, 1),
                              ),
                              child: const Text(
                                'Comment...',
                                style: TextStyle(
                                  color: AppColors.iconColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 15,
                width: MediaQuery.sizeOf(context).width,
                color: const Color.fromRGBO(244, 244, 244, 1),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  'Recommended articles',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),

              ListNews(),
            ],
          ),
        ),
      ),
    ):SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    ));
  }
}