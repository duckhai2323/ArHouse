import 'package:get/get.dart';

import 'news_controller.dart';

class NewsBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => NewsController());
  }
}