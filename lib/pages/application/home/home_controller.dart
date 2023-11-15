import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thietthach_app/routes/names.dart';

class HomeController extends GetxController{
  HomeController();
  final statePageView = 0.obs;
  final itemNum = 5.obs;
  final checkLove = false.obs;
  PageController pageController = PageController(initialPage: 0);
  void ChangePageView(int index){
    statePageView.value = index;
  }

  void ClickItemHeart(){
    if(checkLove.isTrue){
      checkLove.value = false;
    } else{
      checkLove.value = true;
    }
  }

  void HandlePageLibrary(){
    Get.toNamed(AppRoutes.LIBRARYHOUSE);
  }

  void HandleKnowledge(){
    Get.toNamed(AppRoutes.KNOWLEDGE);
  }
}