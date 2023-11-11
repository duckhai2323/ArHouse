import 'package:get/get.dart';
import 'package:thietthach_app/pages/signin_signup/signin/signin_controller.dart';

class SignInBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}