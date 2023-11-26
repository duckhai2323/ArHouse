import 'package:get/get.dart';
import 'package:thietthach_app/routes/names.dart';

import 'item.dart';

class LibraryController extends GetxController{
  List<ItemList> list = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    list.add(ItemList('Exterior','assets/images/library/exterior.jpg'));
    list.add(ItemList('Living','assets/images/library/living.jpg'));
    list.add(ItemList('HomeOffice','assets/images/library/homeoffice.jpg'));
    list.add(ItemList('Kitchen','assets/images/library/kitchen.jpg'));
    list.add(ItemList('Bathroom','assets/images/library/bathroom.jpg'));
    list.add(ItemList('Bedroom','assets/images/library/bedroom.jpg'));
    list.add(ItemList('Laundry','assets/images/library/laundry.jpg'));
    list.add(ItemList('Baby & Kid','assets/images/library/baby.jpg'));
  }
  void HandleAllDesign(){
    Get.toNamed(AppRoutes.ALLDESIGN);
  }

  void HandleDesignDetail(String room){
    Get.toNamed(AppRoutes.ALLDESIGN,parameters: {'room':room});
  }
}