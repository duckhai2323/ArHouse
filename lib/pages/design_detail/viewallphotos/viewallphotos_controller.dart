import 'package:get/get.dart';

import '../../../routes/names.dart';

class ViewAllPhototsController extends GetxController{
  final showInformation = false.obs;

  void ShowInformation(){
    if(showInformation.isTrue){
      showInformation.value = false;
    } else {showInformation.value = true;}
  }

  void HandleImageView(){
    Get.toNamed(AppRoutes.IMAGEVIEW);
  }
}