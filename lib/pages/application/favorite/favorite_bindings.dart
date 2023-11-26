import 'package:get/get.dart';
import 'package:thietthach_app/pages/application/favorite/facvorite_controller.dart';

class FavoriteBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteController());
  }
}