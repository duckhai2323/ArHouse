import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/application/hotline/hotline_controller.dart';

import '../../../colors/colors.dart';

class HotlinePage extends GetView<HotlineController>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:AppColors.logoColor,
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
                color: AppColors.backgroundColor,
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemHotline(context,"Nhan vien tu van", "0987678678"),
            ItemHotline(context,"Nhan vien tu van", "0987678678"),
            ItemHotline(context,"Nhan vien tu van", "0987678678"),
          ],
        ),
      ),
    );
  }

  Widget ItemHotline(BuildContext context,String title, String numberphone){
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
                  color: Colors.black,
                ),
              ),

              const Icon(
                CupertinoIcons.chat_bubble_text_fill,
                color: AppColors.backgroundIntro,
                size: 30,
              ),
            ],
          ),

          const SizedBox(height: 5,),

          Text(
            numberphone,
            style: const TextStyle(
              color: AppColors.iconColor
            ),
          ),
        ],
      ),
    );
  }
}