
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/design_detail/designdetail_controller.dart';

import '../../colors/colors.dart';
import '../../routes/names.dart';

class ListImage extends GetView<DesignDetailController>{

  final BuildContext context;
  final Function(BuildContext context) HandleViewAllPhotos;

  ListImage ({
    required this.context,
    required this.HandleViewAllPhotos,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
            scrollDirection:Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns in the grid
              crossAxisSpacing: 2, // Spacing between columns
              mainAxisSpacing: 2, // Spacing between rows
            ),
            itemCount: 6,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index){
              return InkWell(
                onTap: (){controller.HandleImageView();},
                child: Image(
                  image: AssetImage('assets/images/nhadep1.jpg'),
                  width: MediaQuery.sizeOf(context).width/3,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
        ),

        InkWell(
          onTap: (){
            controller.HandleAllPhotosPage(context);
            //Get.toNamed(AppRoutes.VIEWALLPHOTOS);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 15,top: 20,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'View all photos (29 photos)',
                  style: TextStyle(
                      color: AppColors.backgroundIntro,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),
                ),

                Icon(Icons.arrow_forward_ios,size: 20,color: AppColors.backgroundIntro,)
              ],
            ),
          ),
        ),

        Container(height: 15,color: Color.fromRGBO(244, 244, 244, 1),),
      ],
    );
  }
}