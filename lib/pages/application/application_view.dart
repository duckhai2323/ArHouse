import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/pages/application/application_controller.dart';
import 'package:thietthach_app/pages/application/favorite/favorite_page.dart';
import 'package:thietthach_app/pages/application/home/home_view.dart';
import 'package:thietthach_app/pages/application/hotline/hotline_view.dart';
import 'package:thietthach_app/pages/application/message/message_view.dart';
import 'package:thietthach_app/pages/application/profile/profile_view.dart';

import '../../colors/colors.dart';

class ApplicationPage extends GetView<ApplicationController>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: (index){
            controller.handPageChanged(index);
          },
          children: [
            HomePage(),
            FavoritePage(),
            MessagePage(),
            HotlinePage(),
            ProfilePage(),
          ],
        ),

        bottomNavigationBar: Obx(() => BottomNavigationBar(
          items: controller.position == "admin"?controller.bottomTabAmin:controller.bottomTab,
          currentIndex: controller.state.value,
          type: BottomNavigationBarType.fixed,
          onTap: controller.handNavBarTap,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedItemColor: AppColors.backgroundIntro,
          unselectedItemColor: Colors.grey,
        )),
      ),
    );
  }
}