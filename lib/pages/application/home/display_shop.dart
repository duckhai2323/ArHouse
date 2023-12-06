
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../colors/colors.dart';
import 'home_controller.dart';

class ShopDepartment extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection:Axis.horizontal,
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index){
          return Container(
            margin: const EdgeInsets.only(left: 10,bottom: 10, top: 10,right: 5),
            width: 145,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0,2),
                ),
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(2,0),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(topRight:Radius.circular(4),topLeft: Radius.circular(4)),
                  child: Image(
                    image: AssetImage(controller.products[index].linkImage!),
                    width: 145,
                    height: 110,
                    fit: BoxFit.fill,
                  ),
                ),

                SizedBox(
                  width: 145,
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Text(
                        controller.products[index].textItem!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}