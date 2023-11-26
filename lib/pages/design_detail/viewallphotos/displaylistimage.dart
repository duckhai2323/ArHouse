
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/design_detail/viewallphotos/viewallphotos_controller.dart';

import '../../../colors/colors.dart';

class DisplayListImage extends GetView<ViewAllPhototsController>{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
          ),
          Obx(() => GridView.builder(
            scrollDirection:Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns in the grid
              crossAxisSpacing: 8, // Spacing between columns
              mainAxisSpacing: 8, // Spacing between rows
            ),
            itemCount: controller.dataHouse[0].images.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index){
              return InkWell(
                onTap: (){controller.HandleImageView(index);},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image(
                    image: CachedNetworkImageProvider(controller.dataHouse[0].images[index]),
                    width: MediaQuery.sizeOf(context).width/3,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          )),

          const SizedBox(height: 20,)
        ],
      )
    );
  }
}