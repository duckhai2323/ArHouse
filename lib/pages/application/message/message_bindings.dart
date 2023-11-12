
import 'package:get/get.dart';
import 'package:thietthach_app/pages/application/message/message_controller.dart';

class MessageBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => MessageController());
  }
}















