import 'package:get/get.dart';
import 'package:thietthach_app/pages/signin_signup/signup/signup_controller.dart';

class SignUpBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}