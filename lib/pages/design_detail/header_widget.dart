

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/pages/design_detail/designdetail_controller.dart';

import '../../colors/colors.dart';

class HeaderWidget extends GetView<DesignDetailController>{

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.houseData[0].id!,
                style: const TextStyle(
                  color: AppColors.backgroundIntro,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),

              Text(
                controller.date.value!,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 4.5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemSize: 20,
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const Text(
                      ' . 2 Reviews',
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.backgroundIntro,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(onTap:(){controller.ClickItemHeart();},child: ItemInteract(Icon(controller.checkSave.isFalse?CupertinoIcons.heart:CupertinoIcons.heart_solid,size: 30,color: AppColors.backgroundIntro,),controller.houseData[0].userlike.length.toString()!)),
            const SizedBox(width: 15,),
            ItemInteract(Icon(Icons.share,size: 30,color: AppColors.backgroundIntro,), '5'),
            const SizedBox(width: 15,),
            ItemInteract(Icon(Icons.chat_outlined,size: 30,color: AppColors.backgroundIntro,),'2'),
            const SizedBox(width: 15,),
          ],
        ),
      ],
    ));
  }

  Widget ItemInteract(Icon icon, String text){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        Text(
          text,
          style: const TextStyle(
              color: AppColors.backgroundIntro,
              fontSize: 15,
              fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }
}