import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/application/message/displayuser.dart';

import '../../../colors/colors.dart';

class MessagePage extends GetView<GetxController>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.backgroundColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: Colors.grey.withOpacity(0.3),
              height: 1,
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    iconSize: 23,
                    color: Colors.black,
                    onPressed: (){

                    },
                  ),
                ],
              ),
              const Text(
                'Message',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            DisplayUser(),
          ],
        ),
      ),
    );
  }
}