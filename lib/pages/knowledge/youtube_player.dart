
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../colors/colors.dart';
import 'knowledge_controller.dart';
import 'models/video_list.dart';

class YoutubePlayerScreen extends GetView<KnowledgeController>{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment:MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YoutubePlayer(
          controller: controller.youtubeController1,
          showVideoProgressIndicator: true,
        ),

        Padding(
          padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
          child: Text(
            controller.video1.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
        ),

        Padding(
          padding:const EdgeInsets.only(bottom: 3,left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Icon(Icons.calendar_month_outlined,color: AppColors.backgroundIntro,size:20,),
              const SizedBox(width: 5,),
              Text(
                setTime(controller.video1.publishedAt),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 10,),
      ],
    );
  }

  String setTime(DateTime dateTime){
    String formattedDateTime = DateFormat('dd/MM/yyyy').format(dateTime);
    return formattedDateTime;
  }

}