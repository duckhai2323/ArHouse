import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/documentObject/favoriteitem.dart';
import 'package:thietthach_app/pages/application/application_controller.dart';

import '../../../routes/names.dart';

class FavoriteController extends GetxController{
  List<FavoriteItem> listFavor = <FavoriteItem>[].obs;
  final db = FirebaseFirestore.instance;
  var listener;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetData();
  }

  Future<void> GetData() async {
    var data = await db.collection("users").doc(ApplicationController.id).collection("favorite_designs").withConverter(
        fromFirestore: FavoriteItem.fromFirestore,
        toFirestore: (FavoriteItem favoriteItem, options) => favoriteItem.toFirestore()
    ).orderBy("timestamp",descending: false);
    listFavor.clear();
    listener = data.snapshots().listen((event) {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null) {
              listFavor.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            break;
          case DocumentChangeType.removed:
            if (change.doc.data() != null) {
              FavoriteItem removedItem = change.doc.data()!;
              listFavor.removeWhere((item) => item.id == removedItem.id);
            }
            break;
        }
      }
    });
  }

  void HandleDesignDetails(String id){
    Get.toNamed(AppRoutes.DESIGNDETAIL,parameters: {"id":id});
  }

}