import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors/colors.dart';

class ApplicationController extends GetxController{
  static late String id;
  static late String image;
  static late String username;
  ApplicationController();
  final state = 0.obs;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTab;

  @override
  void onInit() {
    super.onInit();
    id = Get.parameters['id']??"";
    image = Get.parameters['image']??"";
    username = Get.parameters['username']??"";
    bottomTab = <BottomNavigationBarItem> [
      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.home,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          CupertinoIcons.house_fill,
          color: AppColors.backgroundIntro,
          size: 25,
        ),
        label: 'Home',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.heart,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          CupertinoIcons.heart_solid,
          color: AppColors.backgroundIntro,
          size: 25,
        ),
        label: 'Yêu thích',
        backgroundColor: Colors.transparent,
      ),

      /*const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.chat_bubble_text,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          CupertinoIcons.chat_bubble_text_fill,
          color: AppColors.backgroundIntro,
          size: 25,
        ),

        label: 'Chat',
        backgroundColor: Colors.transparent,
      ),*/

      const BottomNavigationBarItem(
        icon: Icon(
          Icons.phone_in_talk_outlined,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          Icons.phone_in_talk,
          color: AppColors.backgroundIntro,
          size: 25,
        ),
        label: 'Hotline',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          Icons.perm_identity,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          Icons.person,
          color: AppColors.backgroundIntro,
          size: 25,
        ),
        label: 'Tôi',
        backgroundColor: Colors.transparent,
      ),
    ];

    pageController = PageController(initialPage: state.value);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void handPageChanged(int index) {
    state.value = index;
  }

  void handNavBarTap(int index) {
    pageController.jumpToPage(index);
  }
}