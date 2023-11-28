import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../documentObject/msg.dart';
import '../../../documentObject/user.dart';
import '../../../routes/names.dart';
import '../application_controller.dart';

class HotlineController extends GetxController{
  List<UserClient> listConsultant = <UserClient>[].obs;
  var db = FirebaseFirestore.instance;
  final delay = true.obs;
  @override
  void onReady() async {
    // TODO: implement onInit
    super.onReady();
    GetAdmin();
  }
  Future<void> GetAdmin() async {
    await Future.delayed(const Duration(seconds: 1));
    var data = await db.collection('admins').withConverter(
      fromFirestore: UserClient.fromFirestore,
      toFirestore: (UserClient userClient, options) => userClient.toFirestore()
    ).get();
    if(data.docs.isNotEmpty){
      data.docs.forEach((element) {
        if(element.data().position == "consultant1"||element.data().position == "consultant2"||element.data().position == "consultant3"){
          listConsultant.add(element.data());
        }
      });
    }
    delay.value = false;
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


}