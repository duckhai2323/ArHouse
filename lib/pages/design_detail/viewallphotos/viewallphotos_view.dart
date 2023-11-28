import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thietthach_app/pages/design_detail/viewallphotos/displaylistimage.dart';
import 'package:thietthach_app/pages/design_detail/viewallphotos/information_project.dart';
import 'package:thietthach_app/pages/design_detail/viewallphotos/viewallphotos_bindings.dart';
import 'package:thietthach_app/pages/design_detail/viewallphotos/viewallphotos_controller.dart';

import '../../../colors/colors.dart';

class ViewAllPhotosPage extends GetView<ViewAllPhototsController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>controller.delay.isTrue?SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Obx(() => Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    child: Image(
                      image: CachedNetworkImageProvider(controller.dataHouse[0].images[0]),
                      height: 230,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                  ),

                  Positioned(
                    top: 30,
                    left: 10,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(73, 73, 73, 0.7),
                            shape: BoxShape.circle
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios,
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
                padding: const EdgeInsets.only(left: 15,top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.dataHouse[0].id!,
                      style: const TextStyle(
                        color: AppColors.backgroundIntro,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),

                    Text(
                      DateFormat.yMMMMd('en_US').format(controller.dataHouse[0].timestamp!),
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

              InkWell(
                onTap: (){
                  controller.ClickItem(controller.to_user);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width-30,
                  height: 45,
                  margin: EdgeInsets.symmetric(horizontal:15,vertical: 20),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundIntro,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child:const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.chat,size: 30,color: Colors.white,),
                        SizedBox(width: 5,),
                        Text(
                          'Message',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap:(){
                        controller.ShowInformation();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              'Project Information',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),

                          Obx(() =>  Transform.rotate(
                            angle: 90*pi/180,
                            child: Icon(
                              controller.showInformation.isTrue?Icons.arrow_back_ios_new: Icons.arrow_forward_ios,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),),
                        ],
                      ),
                    ),

                    Obx(() => Visibility(
                        visible: controller.showInformation.value,
                        child: ProjectInformation()
                    )),
                  ],
                ),
              ),

              //ProjectInformation(),

              DisplayListImage(),

            ],
          ),)
      ):Center(
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          child: const CircularProgressIndicator(),
        ),
      ))
    );
  }
}