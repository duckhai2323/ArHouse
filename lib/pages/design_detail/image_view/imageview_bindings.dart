import 'package:get/get.dart';
import 'package:thietthach_app/pages/design_detail/image_view/imageview_controller.dart';

class ImageViewBiding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ImageViewController());
  }
}