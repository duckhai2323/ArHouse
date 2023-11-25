import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:thietthach_app/colors/colors.dart';
import 'package:thietthach_app/pages/design_detail/designdetail_controller.dart';

class DesignDetailPage extends GetView<DesignDetailController>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(()=>(controller.delay.isTrue)?Stack(
          children: [
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              itemCount: controller.houseData[0].images.length,
              pageController: controller.controller,
              onPageChanged: (index){},
              builder: (BuildContext context,int index){
                return PhotoViewGalleryPageOptions(
                  imageProvider: CachedNetworkImageProvider(controller.houseData[0].images[index]),
                  initialScale: PhotoViewComputedScale.covered,
                );
              },
            ),

            Obx(() => Visibility(
              visible: controller.checkShowDialog.isTrue?false:true,
              child: Positioned(
                top: 20,
                left: 15,
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.arrow_back_ios,color: Colors.white,size: 25,),
                      Text(
                        'Return',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),

            Obx(() => Positioned(
              bottom: 30,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        InkWell(
                          onTap: (){
                            controller.ShowDialog(context);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(73, 73, 73, 0.7),
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Transform.rotate(
                                angle: 90*pi/180,
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 15,),

                        Transform.rotate(
                          angle: 90 * pi / 180,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(73, 73, 73, 0.7),
                                shape: BoxShape.circle
                            ),
                            child: const Center(
                              child: Icon(
                                // controller.checkLove.isTrue ? CupertinoIcons.heart_solid:CupertinoIcons.heart,
                                Icons.local_offer_outlined,
                                size: 28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    InkWell(
                      onTap: (){controller.ClickSave();},
                      child: Container(
                        width: 100,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.backgroundIntro,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(controller.checkSave.isTrue ? CupertinoIcons.heart_solid:CupertinoIcons.heart,size: 25,color: Colors.white,),
                            const SizedBox(width: 5,),
                            const Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ):Center(
          child: Container(
            margin: EdgeInsets.only(top: 40),
            child: CircularProgressIndicator(),
          ),
        )),
      ),
    );
  }
}