import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/documentObject/user.dart';
import 'package:thietthach_app/pages/application/hotline/hotline_controller.dart';

import '../../../colors/colors.dart';

class HotlinePage extends GetView<HotlineController>{
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.delay.isFalse?SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:AppColors.backgroundColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: Container(
              color: Colors.grey.shade300,
              height: 1,
            ),
          ),
          flexibleSpace: const Center(
            child: Text(
              'Hotline ArHouse',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: Obx(()=>Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemHotline(context,"Construction consultant",controller.listConsultant.firstWhere((element) => element.position == "consultant1")),
            ItemHotline(context,"Customer service",controller.listConsultant.firstWhere((element) => element.position == "consultant2")),
            ItemHotline(context,"Warranty - maintenance",controller.listConsultant.firstWhere((element) => element.position == "consultant3")),
          ],
        ),),
      ),
    )
        :SafeArea(
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

  Widget ItemHotline(BuildContext context,String title,UserClient consultant){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: MediaQuery.sizeOf(context).width,
      height: 95,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1,color: AppColors.borderColor))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: AppColors.backgroundIntro,
                ),
              ),

              InkWell(
                onTap: (){
                  controller.ClickItem(consultant);
                },
                child: const Icon(
                  CupertinoIcons.chat_bubble_text_fill,
                  color: AppColors.backgroundIntro,
                  size: 30,
                ),
              ),
            ],
          ),


          Text(
            consultant.username!,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w500,
            ),
          ),

          Text(
            consultant.numberphone!,
            style: const TextStyle(
              color: AppColors.iconColor
            ),
          ),
        ],
      ),
    );
  }
}