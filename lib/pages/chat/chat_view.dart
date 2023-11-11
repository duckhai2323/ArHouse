
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/chat/chat_appbar.dart';

import '../../colors/colors.dart';
import 'chat_controller.dart';
import 'chat_list.dart';

class ChatPage extends GetView<ChatController>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: Container(
              color: Colors.grey.withOpacity(0.3),
              height: 1,
            ),
          ),
          leading: InkWell(
            onTap: (){},
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.backgroundIntro,
            ),
          ),
          flexibleSpace: ChatAppBar(),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: [
              ChatList(),
              Positioned(
                bottom: 5,
                height: 50,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Visibility(
                          //visible: controller.visible.value,
                          visible: true,
                          child: const Icon(
                            Icons.add_circle,
                            color: Colors.lightBlue,
                            size: 30,
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            //controller.visible.value = true;
                          },
                          child: Visibility(
                            //visible: !controller.visible.value,
                            visible: true,
                            child: const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.lightBlue,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                            //visible: controller.visible.value,
                            visible: true,
                            child: SizedBox(width: 20,)),
                        Visibility(
                          //visible: controller.visible.value,
                          visible: true,
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.lightBlue,
                            size: 30,
                          ),
                        ),
                        Visibility(
                            //visible: controller.visible.value,
                            visible: true,
                            child: SizedBox(width: 20,)
                        ),
                        Visibility(
                          //visible: controller.visible.value,
                          visible: true,
                          child: const Icon(
                            Icons.image_rounded,
                            color: Colors.lightBlue,
                            size: 30,
                          ),
                        ),
                        Visibility(
                            //visible: controller.visible.value,
                            visible: true,
                            child: SizedBox(width: 20,)
                        ),
                        Visibility(
                          //visible: controller.visible.value,
                          visible: true,
                          child: const Icon(
                            Icons.mic,
                            color: Colors.lightBlue,
                            size: 30,
                          ),
                        ),
                        Visibility(
                            //visible: controller.visible.value,
                            visible: true,
                            child: SizedBox(width: 20,)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: TextField(
                              //controller: messageText,
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(top: 5,left: 10),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                suffixIcon: Icon(Icons.insert_emoticon_rounded,color: Colors.lightBlue,size: 25,),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(color: Colors.grey.shade200,width: 1),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(color: Colors.lightBlue),
                                ),
                                hintText: 'Aa',
                                hintStyle: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,),
                              ),
                              onTap: (){
                                //controller.visible.value = false;
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        InkWell(
                          onTap: (){
                           /* String str = messageText.text.toString();
                            if(str!=""){
                              controller.sendMessage(str);
                            }
                            messageText.text = "";*/
                          },
                          child: const Icon(
                            Icons.send,
                            color: Colors.lightBlue,
                            size: 25,
                          ),
                        ),
                        SizedBox(width: 15,),
                      ],
                    ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}