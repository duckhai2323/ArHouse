import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thietthach_app/documentObject/inforitem.dart';
import 'package:thietthach_app/house/exterior.dart';
import 'package:thietthach_app/house/kitchen.dart';
import 'package:thietthach_app/pages/application/application_controller.dart';

import '../../../documentObject/msg.dart';
import '../../../documentObject/user.dart';
import '../../../house/house.dart';
import '../../../routes/names.dart';

class ViewAllPhototsController extends GetxController{
  final showInformation = false.obs;
  late String id;
  late String room;
  final dataHouse = [].obs;
  final db = FirebaseFirestore.instance;
  final delay = false.obs;
  final dataUser = [].obs;
  late UserClient to_user;
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
            GetInforAdmin(dataHouse[0].admin);
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
          dataHouse.value = <Kitchen>[];
          final data = await db.collection("projects").withConverter(
              fromFirestore: Kitchen.fromFirestore,
              toFirestore: (Kitchen kitchen, options) => kitchen.toFirestore()
          ).where("id",isEqualTo: id).get();

          if(data.docs.isNotEmpty){
            dataHouse.add(data.docs[0].data());
            GetInforAdmin(dataHouse[0].admin);
          }
          listInfor.add(InforItem("Layout",dataHouse[0].layout));
          listInfor.add(InforItem("type",dataHouse[0].type));
          listInfor.add(InforItem("Number of Islands",dataHouse[0].numberofislands));
          listInfor.add(InforItem("Cabinet Style",dataHouse[0].cabinetstyle));
          listInfor.add(InforItem("Cabinet Finish",dataHouse[0].cabinetfinish));
          listInfor.add(InforItem("Counter Material",dataHouse[0].countermaterial));
          listInfor.add(InforItem("Counter Color",dataHouse[0].countercolor));
          listInfor.add(InforItem("Back Splash Color",dataHouse[0].backsplashcolor));
          listInfor.add(InforItem("Appliance Finish",dataHouse[0].appliancefinish));
          listInfor.add(InforItem("Sink",dataHouse[0].sink));
          listInfor.add(InforItem("Floor Material",dataHouse[0].floormaterial));
          listInfor.add(InforItem("Floor Color",dataHouse[0].floorcolor));
          listInfor.add(InforItem("Ceiling Design",dataHouse[0].ceilingdesign));
        }
        break;
    }
    delay.value = true;
  }

  Future<void> GetInforAdmin(String id) async {
    final data = await db.collection("admins").withConverter(
        fromFirestore: UserClient.fromFirestore,
        toFirestore: (UserClient exterior, options) => exterior.toFirestore()
    ).where("id",isEqualTo: id).get();

    if(data.docs.isNotEmpty){
      to_user = data.docs[0].data();
    }
  }

  ClickItem(UserClient to_user) async {
    String checkFist = 'false';
    String doc_id="";

    var from_messages = await db.collection("message").withConverter(
        fromFirestore:Msg.fromFirestore,
        toFirestore: (Msg msg, options) => msg.toFirestore()
    ).where(
        "from_uid", isEqualTo: ApplicationController.id
    ).where("to_uid",isEqualTo: to_user.id).get();

    var to_messages = await db.collection("message").withConverter(
        fromFirestore:Msg.fromFirestore,
        toFirestore: (Msg msg, options) => msg.toFirestore()
    ).where(
        "from_uid", isEqualTo: to_user.id
    ).where("to_uid",isEqualTo: ApplicationController.id).get();

    if(from_messages.docs.isNotEmpty || to_messages.docs.isNotEmpty){
      checkFist = 'true';
      if(from_messages.docs.isNotEmpty){doc_id = from_messages.docs.first.id;}
      if(to_messages.docs.isNotEmpty){doc_id = to_messages.docs.first.id;}
    }
    Get.toNamed(AppRoutes.CHAT,parameters: {"to_uid": to_user.id??"","to_name":to_user.username??"","to_avatar":to_user.image??"","check_first":checkFist??"","doc_id":doc_id??""});
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