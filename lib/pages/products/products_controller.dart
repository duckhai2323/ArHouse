import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/documentObject/product/product.dart';

import '../../documentObject/favoriteitem.dart';
import '../application/application_controller.dart';

class ProductsController extends GetxController{
  List<Product> listProducts = <Product>[].obs;
  final db = FirebaseFirestore.instance;
  var listener;
  var delay = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetListProducts();
  }

  Future<void> GetListProducts() async {
    var data = db.collection("products").withConverter(
        fromFirestore: Product.fromFirestore,
        toFirestore: (Product product, options) => product.toFirestore()
    ).orderBy("timestamp",descending: false);
    listProducts.clear();
    listener = data.snapshots().listen((event) {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null) {
              listProducts.insert(0, change.doc.data()!);
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

  void ClickItemHeart(int index) async {
    final itemData = listProducts[index];
    if(listProducts[index].userlike.contains(ApplicationController.id)){
      itemData.userlike.remove(ApplicationController.id);
      listProducts.insert(index,itemData);
      listProducts.removeAt(index+1);
      await db.collection("users").doc(ApplicationController.id).collection("favorite_products").doc(itemData.id).delete();
    }else {
      itemData.userlike.add(ApplicationController.id);
      listProducts.insert(index,itemData);
      listProducts.removeAt(index+1);
      final favoriterItem = FavoriteItem(itemData.id,listProducts[index].id, listProducts[index].images[0],"", DateTime.now());
      await db.collection("users").doc(ApplicationController.id).collection("favorite_products").withConverter(
          fromFirestore: FavoriteItem.fromFirestore,
          toFirestore: (FavoriteItem favoriteItem, options) => favoriteItem.toFirestore()
      ).doc(itemData.id).set(favoriterItem);
    }
    await db.collection("products").doc(listProducts[index].id).update({
      "userlike":List<String>.from(itemData.userlike ?? []),
    });
  }
}