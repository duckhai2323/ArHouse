import 'package:get/get.dart';
import 'package:thietthach_app/pages/application/hotline/hotline_controller.dart';

class HotlineBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => HotlineController());
  }
}