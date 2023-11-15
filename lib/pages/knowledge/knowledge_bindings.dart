import 'package:get/get.dart';

import 'knowledge_controller.dart';

class KnowledgeBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => KnowledgeController());
  }
}