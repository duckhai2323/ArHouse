
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/design_detail/viewallphotos/viewallphotos_controller.dart';

import '../../../colors/colors.dart';

class DisplayListImage extends GetView<ViewAllPhototsController>{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
          ),
          GridView.builder(
            scrollDirection:Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns in the grid
              crossAxisSpacing: 8, // Spacing between columns
              mainAxisSpacing: 8, // Spacing between rows
            ),
            itemCount: 9,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index){
              return InkWell(
                onTap: (){controller.HandleImageView();},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image(
                    image: AssetImage('assets/images/nhadep.jpg'),
                    width: MediaQuery.sizeOf(context).width/3,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),

          SizedBox(height: 20,)
        ],
      )
    );
  }
}