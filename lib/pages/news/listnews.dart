
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:thietthach_app/colors/colors.dart';

import 'news_controller.dart';

class ListNews extends GetView<NewsController>{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: AppColors.backgroundColor,
      child: Obx(()=>ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: controller.listNews.length<5?controller.listNews.length:5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, index ){
          return InkWell(
            onTap: (){
              controller.HandleOrtherNews(controller.listNews[index].id!);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
              width: MediaQuery.of(context).size.width,
              height: 130,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Image(
                      image: CachedNetworkImageProvider(controller.listNews[index].images[0]),
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Padding(
                          padding: EdgeInsets.only(left: 15,top: 15),
                          child: Text(
                            'ArHouse TV Blog',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.iconColor,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 15,top: 20),
                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            controller.listNews[index].title!,
                            style: const TextStyle(
                              height: 1.2,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        const SizedBox(height: 5,),

                        Padding(
                          padding:const EdgeInsets.only(bottom: 3,left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(Icons.calendar_month_outlined,color: AppColors.iconColor,size:20,),
                              const SizedBox(width: 5,),
                              Text(
                                DateFormat.yMMMMd('en_US').format(controller.listNews[index].timestamp!),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: AppColors.iconColor,
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
      )),
    );
  }
}