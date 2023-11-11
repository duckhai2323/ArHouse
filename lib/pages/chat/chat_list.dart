import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'chat_controller.dart';
import 'chat_left_item.dart';
import 'chat_right_item.dart';

class ChatList extends GetView<ChatController>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 80),
      child: CustomScrollView(
        //controller: controller.msgScrolling,
        reverse: true,
        slivers: [
          SliverPadding(padding: EdgeInsets.all(0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index){
                  /*if(controller.listContent[index].uid == controller.user_id){
                    return ChatRightItem(controller.listContent[index].content.toString());
                  }else {
                    return ChatLeftItem(controller.listContent[index].content.toString(),controller.to_avatar.toString());
                  }*/
                      Random random = Random();
                      int x  = random.nextInt(2) +1;
                      if(x == 1) {
                        return ChatRightItem('anh co o do ko a');
                      } else {
                        return ChatLeftItem('ko em a! anh ve r','aa');
                      }
                },
                //childCount: controller.listContent.length,
                childCount: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}