import 'package:get/get.dart';
import 'package:thietthach_app/pages/news/list/list_controller.dart';

class ListNewsBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ListNewsController());
  }
}