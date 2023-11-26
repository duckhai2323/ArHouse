import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ImageViewController extends GetxController{
  PageController controller = PageController(initialPage: 0);
  List<String> images = <String>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    images = Get.arguments['images'];
    controller = PageController(initialPage: Get.arguments['index']);
  }
}