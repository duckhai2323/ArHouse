import 'package:get/get.dart';
import 'package:thietthach_app/pages/products/products_controller.dart';

class ProductsBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
  }
}