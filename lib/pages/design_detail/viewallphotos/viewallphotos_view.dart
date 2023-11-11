import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/pages/design_detail/viewallphotos/displaylistimage.dart';
import 'package:thietthach_app/pages/design_detail/viewallphotos/information_project.dart';
import 'package:thietthach_app/pages/design_detail/viewallphotos/viewallphotos_bindings.dart';
import 'package:thietthach_app/pages/design_detail/viewallphotos/viewallphotos_controller.dart';

import '../../../colors/colors.dart';

class ViewAllPhotosPage extends GetView<ViewAllPhototsController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  child: Image(
                    image: AssetImage('assets/images/nhadep1.jpg'),
                    height: 230,
                    fit: BoxFit.fitWidth,
                  ),
                ),

                Positioned(
                  top: 30,
                  left: 10,
                  child: Icon(Icons.arrow_back_ios_new,size: 25,color: Colors.white,),
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
                    'IDTTG2567',
                    style: TextStyle(
                      color: AppColors.backgroundIntro,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),

                  Text(
                    'ngay 3 thang 11, 2020',
                    style: TextStyle(
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
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemSize: 20,
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Text(
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
                controller.HandleChat();
              },
              child: Container(
                width: MediaQuery.of(context).size.width-30,
                height: 45,
                margin: EdgeInsets.symmetric(horizontal:15,vertical: 20),
                decoration: BoxDecoration(
                  color: AppColors.backgroundIntro,
                  borderRadius: BorderRadius.circular(4),
                ),
                child:Center(
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
              padding: EdgeInsets.only(left: 15,right: 15),
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
                        Expanded(
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
        ),
      ),
    );
  }
}