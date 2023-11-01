import 'package:get/get.dart';
import 'package:thietthach_app/pages/library/library_controller.dart';

class LibraryBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => LibraryController());
  }
}