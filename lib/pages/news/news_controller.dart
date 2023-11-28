import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../documentObject/news.dart';
import '../../routes/names.dart';

class NewsController extends GetxController {
  late News newsData;
  final delay = true.obs;
  final db = FirebaseFirestore.instance;
  var listener;
  late String id;
  List<News> listNews = <News>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    id = Get.parameters['id']??"";
    GetData(id);
  }

  Future<void> GetData(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    final data = await db.collection("news").doc(id).withConverter(
        fromFirestore: News.fromFirestore,
        toFirestore: (News news, options) => news.toFirestore()
    ).get();

    if(data!=null){
      newsData = data.data()!;
      GetListNews();
    }
    delay.value = false;
  }

  Future<void> GetListNews () async {
    var data = db.collection("news").withConverter(
        fromFirestore: News.fromFirestore,
        toFirestore: (News news, options) => news.toFirestore()
    ).orderBy("timestamp",descending: false).where("theme",isEqualTo: newsData.theme);
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
            if(change.doc.data()!=null) {
              News news = change.doc.data()!;
              for(int i = 0; i < listNews.length; i++){
                if(listNews[i].id == news.id){
                  listNews.insert(i, news);
                  listNews.removeAt(i+1);
                }
              }
            }
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    });
  }

  void HandleComment(){
    Get.toNamed(AppRoutes.COMMENT,parameters: {'id':id});
  }

  void HandleOrtherNews(String id_blog){
    GetData(id_blog);
    delay.value = true;
    id = id_blog;
  }
}