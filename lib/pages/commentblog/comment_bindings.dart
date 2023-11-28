import 'package:get/get.dart';
import 'package:thietthach_app/pages/commentblog/comment_controller.dart';

class CommentBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => CommentController());
  }
}
