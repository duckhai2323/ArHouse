import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/pages/alldesign/alldesign_controller.dart';

import '../../colors/colors.dart';

class FilterWidget extends GetView<AllDesignController>{

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin:const  EdgeInsets.only(left: 15),
          height:39,
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: AppColors.backgroundColor,
            border: Border.all(
              color: AppColors.borderColor,
              width: 1,
            ),
          ),
          child:const  Row(
            children: [
              Icon(Icons.menu_open,color: Colors.black,size: 30),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  'Filter',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 10),
            height: 39,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:controller.listFilter0.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context,index){
                return InkWell(
                    onTap:(){
                      controller.ShowDialogFilter(context, controller.listFilter0[index].key??"");
                    } ,
                    child: ItemList(controller.listFilter0[index].text??"", controller.listFilter0[index].color!));
              },
            ),
          ),
        ),
      ],
    ),);
  }

  Widget ItemList(String text, Color color1){
    return Container(
      margin: EdgeInsets.only(left: 10),
      height:39,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
        border: Border.all(
          color: AppColors.borderColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: color1,
              fontSize: 17,
              fontWeight: FontWeight.w500
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Icon(Icons.arrow_drop_down_outlined,size: 25,color: color1,),
          ),
        ],
      ),
    );
  }
}