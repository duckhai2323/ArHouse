import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:thietthach_app/pages/design_detail/image_view/imageview_controller.dart';

class ImageViewPage extends GetView<ImageViewController>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              itemCount: 6,
              pageController: controller.controller,
              onPageChanged: (index){},
              builder: (BuildContext context,int index){
                return PhotoViewGalleryPageOptions(
                  imageProvider: AssetImage('assets/images/nhadep1.jpg'),
                  initialScale: PhotoViewComputedScale.contained,
                );
              },
            ),

            Positioned(
              top: 20,
              left: 15,
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(Icons.arrow_back_ios,color: Colors.white,size: 25,),
                    Text(
                      'Back',
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
          ],
        ),
      ),
    );
  }
}