
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/pages/alldesign/alldesign_controller.dart';

import '../../colors/colors.dart';

class DisplayImage extends GetView<AllDesignController>{

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        scrollDirection:Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 1.1, // Spacing between columns
          mainAxisSpacing: 1, // Spacing between rows
        ),
        itemCount: controller.listData.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index){
          return InkWell(
            onTap: (){controller.HandleDesgnDetail(controller.listData[index].id!);},
            child: Stack(
              children: [
                Image(
                  image: CachedNetworkImageProvider(controller.listData[index].images[0]),
                  width: MediaQuery.sizeOf(context).width/2-1,
                  height: 250,
                  fit: BoxFit.fill,
                ),

                Positioned(
                  right: 15,
                  bottom: 20,
                  child: Container(
                    width: 45,
                    height: 45,
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
                          CupertinoIcons.heart,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
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