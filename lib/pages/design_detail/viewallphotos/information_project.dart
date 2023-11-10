import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thietthach_app/pages/design_detail/viewallphotos/viewallphotos_controller.dart';

class ProjectInformation extends GetView<ViewAllPhototsController>{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (BuildContext context, index){
          return ItemList('Room', 'Exterior');
        },
      ),
    );
  }

  Widget ItemList(String key, String value){
    return Container(
      height: 45,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            key,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}