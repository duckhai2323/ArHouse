import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/pages/alldesign/alldesign_controller.dart';
import 'package:thietthach_app/pages/alldesign/itemfilter.dart';

import '../../colors/colors.dart';

class FilterTextList extends GetView<AllDesignController>{
  @override
  Widget build(BuildContext context) {
    List<ItemFilter> listText = <ItemFilter>[];
    List<String> listKey = <String>[];
    return  Obx((){
      listText.clear();
      listKey.clear();
      for(var entry in controller.mapFilter.entries){
        listText.add(entry.value);
        listKey.add(entry.key);
      }
      return Visibility(
        visible: listText.length>0?true:false,
        child: Container(
          margin: EdgeInsets.only(top: 15),
          width: MediaQuery.of(context).size.width,
          height:35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:listText.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index){
              return ItemList(listText[index].text!,listKey[index]);
            },
          ),
        ),
      );
    });
  }

  Widget ItemList(String text,String key){
    return Container(
      margin: EdgeInsets.only(left: 15),
      height:35,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.backgroundIntro,
        border: Border.all(
          color: AppColors.backgroundIntro,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: InkWell(onTap:(){controller.MapRemoveKey(key);},child: Icon(CupertinoIcons.clear_circled_solid,size: 23,color: Colors.white)),
          ),
        ],
      ),
    );
  }
}