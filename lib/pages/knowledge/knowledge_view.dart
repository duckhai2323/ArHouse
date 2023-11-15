import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:thietthach_app/colors/colors.dart';
import 'package:thietthach_app/pages/knowledge/knowledge_controller.dart';
import 'package:thietthach_app/pages/knowledge/youtube_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'models/video_list.dart';

class KnowledgePage extends GetView<KnowledgeController>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Knowledge House'),
          backgroundColor: AppColors.backgroundIntro,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Obx(() => controller.loading.isTrue?Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Center(child: CircularProgressIndicator()),
          ):Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListVideo(context, controller.listVideoPrepare,'House Construction Preparation Stage'),
            ],
          ),),
        ),
      ),
    );
  }

  Widget ListVideo(BuildContext context, List<VideoItem> list, String title){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15,bottom: 15),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18
              ),
            ),
          ),

          YoutubePlayerScreen(),
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, index ){
              return InkWell(
                onTap: (){
                  switch(title){
                    case "House Construction Preparation Stage": {
                      controller.HandleVideo1(index);
                    }
                    break;
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 15,left: 15,right: 15),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.backgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0,1),
                        )
                      ]
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image(
                              image: CachedNetworkImageProvider(list[index].video.thumbnails.thumbnailsDefault.url),
                              width: 150,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Positioned(
                            top: 35,left: 60,
                            child: Icon(Icons.play_circle_filled,size:35 ,color: Colors.white,),
                          )
                        ],
                      ),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                list[index].video.title,
                                style: const TextStyle(
                                  height: 1.2,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            const SizedBox(height: 5,),

                            Padding(
                              padding:const EdgeInsets.only(bottom: 3,left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Icon(Icons.calendar_month_outlined,color: AppColors.backgroundIntro,size:20,),
                                  const SizedBox(width: 5,),
                                  Text(
                                    setTime(list[index].video.publishedAt),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          Center(
            child: Transform.rotate(
              angle: 90*pi/180,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 25,
                color: AppColors.iconColor,
              ),
            ),
          ),

          SizedBox(height: 10,),
        ],
      ),
    );
  }

  String setTime(DateTime dateTime){
    String formattedDateTime = DateFormat('dd/MM/yyyy').format(dateTime);
    return formattedDateTime;
  }
}