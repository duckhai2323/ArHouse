import 'package:get/get.dart';
import 'package:thietthach_app/pages/application/application_view.dart';

import 'application_controller.dart';
import 'home/home_controller.dart';

class ApplicationBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationController());
    Get.lazyPut(() => HomeController());
  }
}