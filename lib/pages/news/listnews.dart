
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/colors/colors.dart';

import 'news_controller.dart';

class ListNews extends GetView<NewsController>{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: AppColors.backgroundColor,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, index ){
          return InkWell(
            onTap: (){

            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
              width: MediaQuery.of(context).size.width,
              height: 130,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: const Image(
                      image: AssetImage('assets/images/2.jpg'),
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(left: 15,top: 15),
                          child: Text(
                            'ArHouse TV Blog',
                            style: TextStyle(
                             fontSize: 15,
                              color: AppColors.iconColor,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 15,top: 20),
                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            'Nghiem thu cong trinh thuy dien ko co ggi la ko the',
                            style: TextStyle(
                              height: 1.2,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        SizedBox(height: 5,),

                        Padding(
                          padding:EdgeInsets.only(bottom: 3,left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(Icons.calendar_month_outlined,color: AppColors.iconColor,size:20,),
                              SizedBox(width: 5,),
                              Text(
                               'November 28,2023',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.iconColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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