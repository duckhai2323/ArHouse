import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:thietthach_app/pages/commentblog/comment_controller.dart';

import '../../colors/colors.dart';

class CommentPage extends GetView<CommentController>{

  @override
  Widget build(BuildContext context) {
    return Obx(()=>controller.delay.isTrue?SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:AppColors.backgroundColor,
          leading: InkWell(onTap:(){Navigator.pop(context);},child: Icon(Icons.arrow_back_ios, size: 25,color: Colors.black,)),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: Container(
              color: Colors.grey.shade300,
              height: 1,
            ),
          ),
          flexibleSpace: const Center(
            child: Text(
              'Comments',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: [
              Obx(() => ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.listComment.length,
                itemBuilder: (BuildContext context, index){
                  return CommentItem(context,controller.listComment[index].userimage!, controller.listComment[index].title!, controller.listComment[index].username!, controller.listComment[index].timestamp!);
                },
              ),),
              Positioned(
                bottom: 0,
                height: 70,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  constraints: const BoxConstraints(
                    minHeight: 70,
                  ),
                  padding: const EdgeInsets.only(left: 15,right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Màu của đường bóng và độ trong suốt
                        spreadRadius: 5, // Kích thước đường bóng
                        blurRadius: 7, // Độ mờ của đường bóng
                        offset: Offset(0, -3), // Độ dịch chuyển của đường bóng (0,-3 sẽ đẩy lên phía trên)
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
          ),
        ),
      ),
    ):SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
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
            radius: 23,
            backgroundImage: CachedNetworkImageProvider(image),
          ),

          const SizedBox(width: 10,),

          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: AppColors.iconColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
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