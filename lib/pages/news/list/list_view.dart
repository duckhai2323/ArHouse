import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:thietthach_app/pages/news/list/list_controller.dart';

import '../../../colors/colors.dart';

class ListNewsPage extends GetView<ListNewsController>{

  @override
  Widget build(BuildContext context) {
    return Obx(()=> controller.delay.isFalse?SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
              'News',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19,
                color: Colors.black,
              ),
            ),
          ),
        ),

        body: Obx(()=>Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.listNews.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index ){
              return InkWell(
                onTap: (){
                  controller.HandleDocsNews(controller.listNews[index].id!);
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
          ),
        )),
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