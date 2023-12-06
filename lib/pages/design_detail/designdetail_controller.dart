import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thietthach_app/colors/colors.dart';
import 'package:thietthach_app/pages/application/application_controller.dart';
import 'package:thietthach_app/pages/design_detail/comment.dart';
import 'package:thietthach_app/pages/design_detail/header_widget.dart';

import '../../documentObject/comment.dart';
import '../../documentObject/favoriteitem.dart';
import '../../documentObject/house/house.dart';
import '../../routes/names.dart';
import 'displayimage_dialog.dart';

class DesignDetailController extends GetxController{
  late String? id;
  final state = 0.obs;
  PageController controller = PageController(initialPage: 0);
  final checkSave = false.obs;
  final checkShowDialog = false.obs;
  final db = FirebaseFirestore.instance;
  var listener;
  final houseData = <House>[].obs;
  final delay = false.obs;
  final date = ''.obs;
  final listComment = <Comment>[].obs;
  var commentText = TextEditingController();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    id = Get.parameters['id']??"";
    GetData(id.toString());
    GetComment(id.toString());
  }

  Future<void> GetData(String id) async {
    await Future.delayed(const Duration(seconds: 0));
    final data = await db.collection("projects").withConverter(
        fromFirestore: House.fromFirestore,
        toFirestore: (House house, options) => house.toFirestore()
    ).where("id",isEqualTo: id).get();

    if(data.docs.isNotEmpty){
      houseData.add(data.docs[0].data());
    }
    if(houseData[0].userlike.contains(ApplicationController.id)){
      checkSave.value = true;
    }
    date.value = DateFormat.yMMMMd('en_US').format(houseData[0].timestamp!);
  }

  Future<void> GetComment(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    final data = await db.collection("comments").withConverter(
        fromFirestore: Comment.fromFirestore,
        toFirestore: (Comment comment, options) => comment.toFirestore()
    ).orderBy("timestamp",descending: false).where("id_blog",isEqualTo: id);
    listComment.clear();
    listener = data.snapshots().listen((event) {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null) {
              listComment.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    });
    delay.value = true;
  }
  
  Future<void> SendComment(String commentStr) async {
    final comment = Comment(id,ApplicationController.id,commentStr,ApplicationController.username,ApplicationController.image,DateTime.now());
    await db.collection('comments').withConverter(
        fromFirestore: Comment.fromFirestore,
        toFirestore: (Comment comment, options) => comment.toFirestore()
    ).add(comment).then((DocumentReference doc){});
    GetComment(id.toString());
  }
  

  void ShowDialog(BuildContext context){
    checkShowDialog.value = true;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
            )
        ),
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      builder: (context){
        return DraggableScrollableSheet(
          initialChildSize: 1,
          maxChildSize: 1,
          builder: (BuildContext context, ScrollController scrollController){
            return  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    checkShowDialog.value = false;
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25,left: 15,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Transform.rotate(
                          angle: 90*pi/180,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(width: 10),

                        const Text(
                          'Close',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          HeaderWidget(),

                          SizedBox(height: 25,),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              houseData[0].title!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),

                          SizedBox(height: 10,),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              houseData[0].content!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Divider(),
                          ),

                          const Padding(
                            padding: EdgeInsets.only(left: 15,bottom: 10),
                            child: Text(
                              'More photos from this project',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),

                          ListImage(context:context,HandleViewAllPhotos: HandleAllPhotosPage,),

                          CommentWidget(),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }
    );
  }

  void HandleImageView(int index){
    List<String> images = houseData[0].images;
    Get.toNamed(AppRoutes.IMAGEVIEW,arguments:{'images':images, 'index':index});
  }

  void HandleAllPhotosPage(BuildContext context){
    Navigator.pop(context);
    checkShowDialog.value = false;
    Get.toNamed(AppRoutes.VIEWALLPHOTOS,parameters: {'id':id??"",'room':houseData[0].room??""});
  }

  void ClickItemHeart() async {
    final itemData = houseData[0];
    if(checkSave.isTrue){
      itemData.userlike.remove(ApplicationController.id);
      await db.collection("users").doc(ApplicationController.id).collection("favorite_designs").doc(itemData.token).delete();
      checkSave.value = false;
    }else {
      itemData.userlike.add(ApplicationController.id);
      final favoriterItem = FavoriteItem(itemData.token,itemData.id, itemData.images[0],"", DateTime.now());
      await db.collection("users").doc(ApplicationController.id).collection("favorite_designs").withConverter(
          fromFirestore: FavoriteItem.fromFirestore,
          toFirestore: (FavoriteItem favoriteItem, options) => favoriteItem.toFirestore()
      ).doc(itemData.token).set(favoriterItem);
      checkSave.value = true;
    }
    await db.collection("projects").doc(itemData.token).update({
      "userlike":List<String>.from(itemData.userlike ?? []),
    });
  }

}