
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thietthach_app/documentObject/news.dart';
import 'package:thietthach_app/routes/names.dart';

import '../../library/item.dart';

class HomeController extends GetxController{
  HomeController();
  List<ItemList> products = [];
  List<String> images = <String>[].obs;
  List<News> listNews = <News>[].obs;
  final db = FirebaseFirestore.instance;
  var listener;
  final statePageView = 0.obs;
  final itemNum = 5.obs;
  final checkLove = false.obs;
  List<ItemList> list = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetListNews();

    products.add(ItemList('Outdoor','assets/images/products/out.png'));
    products.add(ItemList('Bathroom','assets/images/products/bath.png'));
    products.add(ItemList('Kitchen','assets/images/products/kit.png'));
    products.add(ItemList('Living','assets/images/products/livi.png'));
    products.add(ItemList('Bedroom','assets/images/products/bed.png'));

    list.add(ItemList('HomeOffice','assets/images/library/homeoffice.jpg'));
    list.add(ItemList('Kitchen','assets/images/library/kitchen.jpg'));
    list.add(ItemList('Living','assets/images/library/living.jpg'));
    list.add(ItemList('Bathroom','assets/images/library/bathroom.jpg'));
    list.add(ItemList('Bedroom','assets/images/library/bedroom.jpg'));
    list.add(ItemList('Baby & Kid','assets/images/library/baby.jpg'));
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
  PageController pageController = PageController(initialPage: 0);
  void ChangePageView(int index){
    statePageView.value = index;
  }

  void ClickItemHeart(){
    if(checkLove.isTrue){
      checkLove.value = false;
    } else{
      checkLove.value = true;
    }
  }

  void HandlePageLibrary(){
    Get.toNamed(AppRoutes.LIBRARYHOUSE);
  }

  void HandleKnowledge(){
    Get.toNamed(AppRoutes.KNOWLEDGE);
  }

  void HandleListNews(){
    Get.toNamed(AppRoutes.LISTNEWS);
  }

  void HandleAllDesign(){
    Get.toNamed(AppRoutes.ALLDESIGN);
  }

  void HandleDesignDetail(String room){
    Get.toNamed(AppRoutes.ALLDESIGN,parameters: {'room':room});
  }

  void HandleComment(String id_blog){
    Get.toNamed(AppRoutes.COMMENT,parameters: {'id':id_blog});
  }
}
