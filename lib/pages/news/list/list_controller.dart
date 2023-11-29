import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../documentObject/news.dart';
import '../../../routes/names.dart';

class ListNewsController extends GetxController {
  List<News> listNews = <News>[].obs;
  final db = FirebaseFirestore.instance;
  var listener;
  var delay = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetListNews();
  }

  Future<void> GetListNews () async {
    var data = db.collection("news").withConverter(
        fromFirestore: News.fromFirestore,
        toFirestore: (News news, options) => news.toFirestore()
    ).orderBy("timestamp",descending: false);
    listNews.clear();
    listener = data.snapshots().listen((event) {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null) {
              listNews.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    });
    delay.value = false;
  }

  void HandleDocsNews(String id){
    Get.toNamed(AppRoutes.NEWS,parameters: {'id':id});
  }
}