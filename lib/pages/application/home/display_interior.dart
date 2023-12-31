import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/pages/application/home/home_controller.dart';

import '../../../colors/colors.dart';

class InteriorList extends GetView<HomeController>{
  const InteriorList({super.key});


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection:Axis.horizontal,
        itemCount: controller.list.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index){
          return InkWell(
            onTap: (){
              controller.HandleDesignDetail(controller.list[index].textItem!);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10,bottom: 10, top: 10,right: 5),
              width: 200,
              height: 180,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0,2),
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(2,0),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(topRight:Radius.circular(5),topLeft: Radius.circular(5)),
                    child: Image(
                      image: AssetImage(controller.list[index].linkImage!),
                      width: 200,
                      height: 120,
                      fit: BoxFit.fill,
                    ),
                  ),

                  Container(
                    width: 200,
                    height: 60,
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 5),
                    child: Center(
                      child: Text(
                        controller.list[index].textItem!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                        textAlign:TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}