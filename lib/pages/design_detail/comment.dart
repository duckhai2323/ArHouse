import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:thietthach_app/pages/application/application_controller.dart';
import 'package:thietthach_app/pages/design_detail/designdetail_controller.dart';

import '../../colors/colors.dart';

class CommentWidget extends GetView<DesignDetailController>{

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: AppColors.backgroundIntro),
              ),
              child: const Text(
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
                '${controller.listComment.length} questions for this project',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.listComment.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context,index){
                  return CommentItem(context,controller.listComment[index].userimage!, controller.listComment[index].title!,controller.listComment[index].username!,controller.listComment[index].timestamp!);
                }
            ),
            const SizedBox(height: 70,)
          ],
        ),
        Positioned(
          bottom: 0,
          height: 70,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            constraints: const BoxConstraints(
              minHeight: 70,
            ),
            padding: const EdgeInsets.only(left: 15,right: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: CachedNetworkImageProvider(ApplicationController.image),
                ),

                const SizedBox(width: 10,),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: TextField(
                      controller: controller.commentText,
                      style: const TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 5,left: 10),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        suffixIcon: const Icon(Icons.insert_emoticon_rounded,color: AppColors.backgroundIntro,size: 25,),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey.shade200,width: 1),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: AppColors.backgroundIntro),
                        ),
                        hintText: 'Aa',
                        hintStyle: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,),
                      ),
                      onTap: (){
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 10,),

                InkWell(
                  onTap: (){
                    String text = controller.commentText.text.toString();

                    if(text!=""){
                      controller.SendComment(text);
                    }
                    controller.commentText.text = "";
                  },
                    child: const Icon(Icons.arrow_forward_ios,size: 20,color: AppColors.backgroundIntro)
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget CommentItem(BuildContext context,String image, String title, String username, DateTime dateTime){
    var date = DateFormat.yMMMMd('en_US').format(dateTime);
    return Container(
      width: MediaQuery.sizeOf(context).width,
      constraints: const BoxConstraints(
        minHeight: 100,
      ),
      padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
      decoration: const BoxDecoration(
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
            backgroundImage: CachedNetworkImageProvider(image),
          ),

          const SizedBox(width: 10,),

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
                        text:username,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const TextSpan(text: ' '),
                      TextSpan(
                        text:title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ]
                  ),
                ),

                const SizedBox(height: 5,),

                Text(
                  date,
                  style: const TextStyle(
                    color: AppColors.iconColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 5,),

          const Padding(
            padding: EdgeInsets.only(top: 45),
            child: Icon(Icons.arrow_forward_ios,size: 20,color: AppColors.borderColor,),
          ),
        ],
      ),
    );
  }
}

