import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/colors/colors.dart';
import 'package:thietthach_app/pages/design_detail/header_widget.dart';

import '../../routes/names.dart';
import 'displayimage_dialog.dart';

class DesignDetailController extends GetxController{
  final state = 0.obs;
  PageController controller = PageController(initialPage: 0);
  final checkSave = false.obs;
  final checkShowDialog = false.obs;

  //IventClick

  void ShowDialog(BuildContext context){
    checkShowDialog.value = true;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
            )
        ),
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      builder: (context){
        return DraggableScrollableSheet(
          initialChildSize: 1,
          maxChildSize: 1,
          builder: (BuildContext context, ScrollController scrollController){
            return  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    checkShowDialog.value = false;
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25,left: 15,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Transform.rotate(
                          angle: 90*pi/180,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(width: 10),

                        Text(
                          'Close',
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

                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          HeaderWidget(),

                          SizedBox(height: 25,),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Mountain Peek',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),

                          SizedBox(height: 10,),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Positioned on the hilltop, this home captures the city lights of the Hill Country Galleria. Multi-use spaces are perfect for both intimate gatherings or for entertaining large groups. Large areas of glass open up to the generous outdoor living, dining and kitchen areas. ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Divider(),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 15,bottom: 10),
                            child: Text(
                              'More photos from this project',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),

                          ListImage(),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }
    );
  }

  void ClickSave(){
    if(checkSave.isTrue){
      checkSave.value = false;
    } else{
      checkSave.value = true;
    }
  }

  void HandleImageView(){
    Get.toNamed(AppRoutes.IMAGEVIEW);
  }
}