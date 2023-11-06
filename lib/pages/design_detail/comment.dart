import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/design_detail/designdetail_controller.dart';

import '../../colors/colors.dart';

class Comment extends GetView<DesignDetailController>{

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: AppColors.backgroundIntro),
          ),
          child: Text(
            'Comment',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: AppColors.backgroundIntro,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 15,bottom: 15,top: 15),
          child: Text(
            '2 questions for this project',
            style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.w600
            ),
          ),
        ),

        CommentItem(context),
        CommentItem(context),
      ],
    );
  }

  Widget CommentItem(BuildContext context){
    return Container(
      width: MediaQuery.sizeOf(context).width,
      constraints: BoxConstraints(
        minHeight: 130,
      ),
      padding: EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.borderColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/nhadep1.jpg'),
          ),

          SizedBox(width: 10,),

          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:'iron man',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(text: ' '),
                      TextSpan(
                        text:'iron man shade of parky vai o aaa hhh chun ha ao ka h thanks',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ]
                  ),
                ),

                SizedBox(height: 5,),

                Text(
                  '.3 phan hoi.',
                  style: TextStyle(
                    color: AppColors.iconColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 5,),

          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Icon(Icons.arrow_forward_ios,size: 20,color: AppColors.borderColor,),
          ),
        ],
      ),
    );
  }
}