import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../documentObject/msg.dart';
import '../../../routes/names.dart';
import '../application_controller.dart';

class MessageController extends GetxController {
  MessageController();
  final token = ApplicationController.id;
  final db = FirebaseFirestore.instance;
  ScrollController msgScrolling = ScrollController();
  final listUser = <Msg>[].obs;
  var listener;

  String textContr (String str){
    if(str.length >= 10){
      return str.substring(0,10);
    } else {
      return str;
    }
  }

  String MessAndTime(Msg msg){
    Timestamp? timestamp = msg.last_time;
    DateTime? dateTime = timestamp?.toDate();
    String timeString = '${dateTime?.hour.toString().padLeft(2, '0')}:${dateTime?.minute.toString().padLeft(2, '0')}';
    return "${msg.last_msg} . ${timeString}";
  }

  @override
  void onInit() async {
    super.onInit();

    var messData =  await db.collection("message").withConverter(
        fromFirestore: Msg.fromFirestore,
        toFirestore: (Msg msg, options) => msg.toFirestore()
    ).orderBy("last_time",descending: false);
    listUser.clear();
    listener = messData.snapshots().listen((event) {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null) {
              if(change.doc.data()?.to_uid == token || change.doc.data()?.from_uid == token){
                listUser.insert(0, change.doc.data()!);
              }
            }
            break;
          case DocumentChangeType.modified:
            if(change.doc.data()!=null) {
              if(change.doc.data()?.to_uid == token || change.doc.data()?.from_uid == token){
                listUser.removeWhere((element) => (element.from_uid == change.doc.data()?.from_uid && element.to_uid == change.doc.data()?.to_uid));
                listUser.insert(0, change.doc.data()!);
              }
            }
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    });
  }

  ClickItemChat(Msg msg) async {
    var messages = await db.collection("message").withConverter(
        fromFirestore:Msg.fromFirestore,
        toFirestore: (Msg msg, options) => msg.toFirestore()
    ).where("from_uid",isEqualTo:msg.from_uid).where("to_uid",isEqualTo: token).get();

    if(msg.from_uid == token){
      Get.toNamed(AppRoutes.CHAT,parameters: {"to_uid": msg.to_uid??"","to_name":msg.to_name??"","to_avatar":msg.to_avatar??"","check_first":"true","doc_id":messages.docs.first.id??""});
    } else {
      Get.toNamed(AppRoutes.CHAT,parameters: {"to_uid": msg.from_uid??"","to_name":msg.from_name??"","to_avatar":msg.from_avatar??"","check_first":"true","doc_id":messages.docs.first.id??""});
    }
  }
}