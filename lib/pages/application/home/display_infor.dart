import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/application/home/home_controller.dart';

import '../../../colors/colors.dart';

class InforCompany extends GetView<HomeController>{
  const InforCompany({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection:Axis.horizontal,
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index){
          return Container(
            margin: EdgeInsets.only(left: 10,bottom: 10, top: 10,right: 5),
            width: 250,
            height: 180,
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
                    image: AssetImage('assets/images/infor.png'),
                    width: 250,
                    height: 120,
                    fit: BoxFit.fill,
                  ),
                ),

                Container(
                  width: 250,
                  padding: EdgeInsets.only(left: 20,right: 20,top: 5),
                  child: Text(
                    'Chuc mung ngay 20/10',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    textAlign:TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                Container(
                  width: 250,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'abc cong ty nay xin vcl luon y ao fsfs fbsb bfs sfsf ffsf fsfhshf sfsbfjsbf sfsbf',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    textAlign:TextAlign.center,
                    overflow: TextOverflow.ellipsis,
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