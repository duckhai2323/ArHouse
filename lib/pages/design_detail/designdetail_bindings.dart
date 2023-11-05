import 'package:get/get.dart';
import 'package:thietthach_app/pages/design_detail/designdetail_controller.dart';

class DesignDeatailBiding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => DesignDetailController());
  }
}