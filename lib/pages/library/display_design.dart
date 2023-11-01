
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../colors/colors.dart';
import 'library_controller.dart';

class DisplayDesign extends GetView<LibraryController>{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        scrollDirection:Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 15, // Spacing between columns
          mainAxisSpacing: 15,
          mainAxisExtent: 200,// Spacing between rows
        ),
        itemCount: 6,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index){
          return Container(
            width: 200,
            height: 190,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(5),
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
                  borderRadius: BorderRadius.only(topRight:Radius.circular(5),topLeft: Radius.circular(5)),
                  child: Image(
                    image: AssetImage('assets/images/nhadep.jpg'),
                    width: 200,
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                ),

                Container(
                  width: 200,
                  height: 60,
                  padding: EdgeInsets.only(left: 30,right: 30,top: 5),
                  child: Center(
                    child: Text(
                      'Kitchen & Dinning',
                      style: TextStyle(
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
          );
        },
      ),
    );
  }
}