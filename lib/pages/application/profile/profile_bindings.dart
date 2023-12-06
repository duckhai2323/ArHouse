import 'package:get/get.dart';
import 'package:thietthach_app/pages/application/profile/profile_controller.dart';

class ProfileBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ProfilerController());
  }
}