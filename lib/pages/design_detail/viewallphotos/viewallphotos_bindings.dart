import 'package:get/get.dart';
import 'package:thietthach_app/pages/design_detail/viewallphotos/viewallphotos_controller.dart';

class ViewAllPhotosBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ViewAllPhototsController());
  }
}