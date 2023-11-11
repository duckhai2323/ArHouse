import 'package:get/get.dart';
import 'package:thietthach_app/pages/chat/chat_controller.dart';

class ChatBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}