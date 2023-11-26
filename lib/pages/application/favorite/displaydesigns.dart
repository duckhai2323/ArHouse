import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/colors/colors.dart';

import 'facvorite_controller.dart';

class DisplayImage extends GetView<FavoriteController>{

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        scrollDirection:Axis.vertical,
        //physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 15, // Spacing between columns
          mainAxisSpacing: 25,
          mainAxisExtent:240,// Spacing between rows
        ),
        itemCount: controller.listFavor.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index){
          return InkWell(
            onTap: (){
              controller.HandleDesignDetails(controller.listFavor[index].id_blog!);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image(
                      image:CachedNetworkImageProvider(controller.listFavor[index].image!),
                      width: MediaQuery.sizeOf(context).width/2,
                      height: 210,
                      fit: BoxFit.fill,
                    ),

                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(73, 73, 73, 0.7),
                            shape: BoxShape.circle
                        ),
                        child: InkWell(
                          onTap: (){

                          },
                          child: const Center(
                            child: Icon(
                              // controller.checkLove.isTrue ? CupertinoIcons.heart_solid:CupertinoIcons.heart,
                              Icons.more_horiz,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    controller.listFavor[index].note==""?'add note':controller.listFavor[index].note!,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.iconColor,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ));
  }
}