import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thietthach_app/documentObject/inforitem.dart';
import 'package:thietthach_app/house/exterior.dart';

import '../../../house/house.dart';
import '../../../routes/names.dart';

class ViewAllPhototsController extends GetxController{
  final showInformation = false.obs;
  late String id;
  late String room;
  final dataHouse = [].obs;
  final db = FirebaseFirestore.instance;
  final delay = false.obs;
  List<InforItem> listInfor = <InforItem>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    id = Get.parameters['id']??"";
    room = Get.parameters['room']??"";
    GetData(id,room);
  }

  Future<void> GetData(String id, String room) async{
    await Future.delayed(const Duration(seconds: 2));
    switch(room){
      case "Exterior":
        {
          dataHouse.value = <Exterior>[];
          final data = await db.collection("projects").withConverter(
              fromFirestore: Exterior.fromFirestore,
              toFirestore: (Exterior exterior, options) => exterior.toFirestore()
          ).where("id",isEqualTo: id).get();

          if(data.docs.isNotEmpty){
            dataHouse.add(data.docs[0].data());
          }
          listInfor.add(InforItem("Room",dataHouse[0].room));
          listInfor.add(InforItem("Number of Stories",dataHouse[0].numberofstories));
          listInfor.add(InforItem("Siding Material",dataHouse[0].sidingmaterial));
          listInfor.add(InforItem("Siding Type",dataHouse[0].sidingtype));
          listInfor.add(InforItem("Roof Material",dataHouse[0].roofmaterial));
          listInfor.add(InforItem("Roof Type",dataHouse[0].rooftype));
          listInfor.add(InforItem("Roof Color",dataHouse[0].roofcolor));
          listInfor.add(InforItem("Building Type",dataHouse[0].buildingtype));

        }
        break;
      case "Kitchen":
        {

        }
        break;
    }
    delay.value = true;
  }

  void ShowInformation(){
    if(showInformation.isTrue){
      showInformation.value = false;
    } else {showInformation.value = true;}
  }

  void HandleImageView(int index){
    Get.toNamed(AppRoutes.IMAGEVIEW,arguments: {'images':dataHouse[0].images,'index':index});
  }

  void HandleChat(){
    Get.toNamed(AppRoutes.CHAT);
  }
}