import 'package:get/get.dart';
import 'package:thietthach_app/pages/alldesign/alldesign_controller.dart';

class AllDesigBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AllDesignController());
  }
}