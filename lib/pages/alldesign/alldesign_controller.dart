import 'dart:ffi';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/colors/colors.dart';
import 'package:thietthach_app/house/house.dart';
import 'package:thietthach_app/pages/alldesign/itemfilter.dart';
import 'package:thietthach_app/routes/names.dart';

import '../../house/exterior.dart';

class AllDesignController extends GetxController{
  List<ItemFilter> listFilter0 = <ItemFilter>[].obs;
  List<ItemFilter> list = <ItemFilter>[].obs;
  List<House> listData = <House>[].obs;
  final db = FirebaseFirestore.instance;
  var listener;
  Map<String,ItemFilter> mapFilter = <String,ItemFilter>{}.obs;
  @override
  void onInit(){
    super.onInit();
    ConstListFiler();
    GetData();
  }

  void ConstListFiler(){
    listFilter0.clear();
    listFilter0.add(ItemFilter('Room',mapFilter.containsKey('room')?AppColors.backgroundIntro:Colors.black,"room"));
    listFilter0.add(ItemFilter('Style',mapFilter.containsKey('style')?AppColors.backgroundIntro:Colors.black,"style"));
    listFilter0.add(ItemFilter('Budget',mapFilter.containsKey('budget')?AppColors.backgroundIntro:Colors.black,"budget"));
    listFilter0.add(ItemFilter('Size',mapFilter.containsKey('size')?AppColors.backgroundIntro:Colors.black,"size"));
    listFilter0.add(ItemFilter('Color',mapFilter.containsKey('color')?AppColors.backgroundIntro:Colors.black,"color"));
  }

  void GetData(){
    var data = db.collection("projects").withConverter(
        fromFirestore: House.fromFirestore,
        toFirestore: (House classToTutor, options) => classToTutor.toFirestore()
    ).orderBy("timestamp",descending: false);
    for(var entry in mapFilter.entries){
      data = data.where(entry.key,isEqualTo: entry.value.text);
    }
    listData.clear();
    listener = data.snapshots().listen((event) {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null) {
              listData.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    });

  }

  void ShowDialogFilter(BuildContext context, ItemFilter itemFilter) {
    int num = listFilter0.indexOf(itemFilter);
    String? key = itemFilter.key;
    String? title = itemFilter.text;

    switch (key) {
      case "room":
        {
          list.clear();
          list.add(ItemFilter("Kitchen", Colors.black, "false"));
          list.add(ItemFilter("Bath", Colors.black, "false"));
          list.add(ItemFilter("Bedroom", Colors.black, "false"));
          list.add(ItemFilter("Living", Colors.black, "false"));
          list.add(ItemFilter("Dining", Colors.black, "false"));
          list.add(ItemFilter("Outdoor", Colors.black, "false"));
          list.add(ItemFilter("Baby&Kids", Colors.black, "false"));
          list.add(ItemFilter("HomeOffice", Colors.black, "false"));
          list.add(ItemFilter("Exterior", Colors.black, "false"));
          list.add(ItemFilter("Wine Cellar", Colors.black, "false"));
          list.add(ItemFilter("Entry", Colors.black, "false"));
          list.add(ItemFilter("Hall", Colors.black, "false"));
          list.add(ItemFilter("Home Bar", Colors.black, "false"));
          list.add(ItemFilter("Staircase", Colors.black, "false"));
          list.add(ItemFilter("Basement", Colors.black, "false"));
        }
        break;

      case "style":
        {
          list.clear();
          list.add(ItemFilter("Contemporary", Colors.black, "false"));
          list.add(ItemFilter("Eclectic", Colors.black, "false"));
          list.add(ItemFilter("Modern", Colors.black, "false"));
          list.add(ItemFilter("Traditional", Colors.black, "false"));
          list.add(ItemFilter("Asian", Colors.black, "false"));
          list.add(ItemFilter("Coastal", Colors.black, "false"));
          list.add(ItemFilter("Craftsman", Colors.black, "false"));
          list.add(ItemFilter("Farmhouse", Colors.black, "false"));
          list.add(ItemFilter("French Country", Colors.black, "false"));
          list.add(ItemFilter("Industrial", Colors.black, "false"));
        }
        break;

      case "size":
        {
          list.clear();
          list.add(ItemFilter("Compact", Colors.black, "false"));
          list.add(ItemFilter("Medium", Colors.black, "false"));
          list.add(ItemFilter("Large", Colors.black, "false"));
          list.add(ItemFilter("Expansive", Colors.black, "false"));
        }
        break;
//exterior
      case "numberofstories":
        {
          list.clear();
          list.add(ItemFilter("1", Colors.black, 'false'));
          list.add(ItemFilter("2", Colors.black, 'false'));
          list.add(ItemFilter("3", Colors.black, 'false'));
          list.add(ItemFilter("4", Colors.black, 'false'));
          list.add(ItemFilter("5", Colors.black, 'false'));
          list.add(ItemFilter("6", Colors.black, 'false'));
          list.add(ItemFilter("7", Colors.black, 'false'));
          list.add(ItemFilter("8", Colors.black, 'false'));
          list.add(ItemFilter("9", Colors.black, 'false'));
          list.add(ItemFilter("10", Colors.black, 'false'));

        }
        break;
        
      case "sidingmaterial":
        {
          list.clear();
          list.add(ItemFilter("Adobe Siding Material", Colors.black, 'false'));
          list.add(ItemFilter("Brick Siding Material", Colors.black, 'false'));
          list.add(ItemFilter("Concrete Siding Material", Colors.black, 'false'));
          list.add(ItemFilter("Concrete Fiberboard Siding Material", Colors.black, 'false'));
          list.add(ItemFilter("Glass Siding Material", Colors.black, 'false'));
          list.add(ItemFilter("Metal Siding Material", Colors.black, 'false'));
          list.add(ItemFilter("Painted Brick Siding Material", Colors.black, 'false'));
          list.add(ItemFilter("Stone Siding Material", Colors.black, 'false'));
          list.add(ItemFilter("Stucco Siding Material", Colors.black, 'false'));
          list.add(ItemFilter("Vinyl Siding Material", Colors.black, 'false'));
          list.add(ItemFilter("Wood Siding Material", Colors.black, 'false'));
        }
        break;
        
      case "sidingtype":
        {
          list.clear();
          list.add(ItemFilter("Board And Batten", Colors.black, 'false'));
          list.add(ItemFilter("Clapboard", Colors.black, 'false'));
          list.add(ItemFilter("Shingles", Colors.black, 'false'));
        }
        break;
        
      case "housecolor":
        {
          list.clear();
          list.add(ItemFilter("Beige", Colors.black, 'false'));
          list.add(ItemFilter("Black", Colors.black, 'false'));
          list.add(ItemFilter("Blue", Colors.black, 'false'));
          list.add(ItemFilter("Brown", Colors.black, 'false'));
          list.add(ItemFilter("Gray", Colors.black, 'false'));
          list.add(ItemFilter("Green", Colors.black, 'false'));
          list.add(ItemFilter("Multi", Colors.black, 'false'));
          list.add(ItemFilter("Orange", Colors.black, 'false'));
          list.add(ItemFilter("Pink", Colors.black, 'false'));
          list.add(ItemFilter("Purple", Colors.black, 'false'));
          list.add(ItemFilter("Red", Colors.black, 'false'));
          list.add(ItemFilter("White", Colors.black, 'false'));
          list.add(ItemFilter("Yellow", Colors.black, 'false'));
        }
        break;
        
      case "rooftype":
        {
          list.clear();
          list.add(ItemFilter("Butterfly", Colors.black, 'false'));
          list.add(ItemFilter("Clipped Gable", Colors.black, 'false'));
          list.add(ItemFilter("Flat", Colors.black, 'false'));
          list.add(ItemFilter("Gable", Colors.black, 'false'));
          list.add(ItemFilter("Gambrel", Colors.black, 'false'));
          list.add(ItemFilter("Hip", Colors.black, 'false'));
          list.add(ItemFilter("Shed", Colors.black, 'false'));
        }
        break;

      case "roofmaterial":
        {
          list.clear();
          list.add(ItemFilter("Green", Colors.black, 'false'));
          list.add(ItemFilter("Metal", Colors.black, 'false'));
          list.add(ItemFilter("Mixed", Colors.black, 'false'));
          list.add(ItemFilter("Shingle", Colors.black, 'false'));
          list.add(ItemFilter("Tile", Colors.black, 'false'));
        }
        break;

      case "roofcolor":
        {
          list.clear();
          list.add(ItemFilter("Black", Colors.black, 'false'));
          list.add(ItemFilter("Blue", Colors.black, 'false'));
          list.add(ItemFilter("Brown", Colors.black, 'false'));
          list.add(ItemFilter("Gray", Colors.black, 'false'));
          list.add(ItemFilter("Red", Colors.black, 'false'));
          list.add(ItemFilter("White", Colors.black, 'false'));
        }
        break;

      case "buildingtype":
        {
          list.clear();
          list.add(ItemFilter("Apartment/Condo", Colors.black, 'false'));
          list.add(ItemFilter("Duplex", Colors.black, 'false'));
          list.add(ItemFilter("House", Colors.black, 'false'));
          list.add(ItemFilter("Tiny House", Colors.black, 'false'));
          list.add(ItemFilter("Townhouse", Colors.black, 'false'));
        }
        break;
        
    }
    if (mapFilter.containsKey(key)) {
      final itemFilterPick = mapFilter[key];
      for(int i=0; i < list.length;i++){
        if(list[i].text == itemFilterPick?.text){
          list.insert(i, itemFilterPick!);
          list.removeAt(i+1);
        }
      }
    }
    DialogFilter(context,list,title!,key!,num);
  }

  void DialogFilter(BuildContext context, List<ItemFilter> list,String title,String key,int num){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )
        ),
        backgroundColor: Colors.transparent,

        builder: (context) {
          return DraggableScrollableSheet(
            initialChildSize: 0.8,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController){
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Close',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),

                          Text(
                            title,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 19,
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Complete',
                              style: TextStyle(
                                color: AppColors.backgroundIntro,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Divider(),

                    Obx(() => Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (_,index){
                          return InkWell(
                            onTap: (){
                              switch(list[index].text){
                                case "Kitchen":{
                                  ConstListFiler();
                                  listFilter0.add(ItemFilter('Layout',Colors.black,"layout"));
                                  listFilter0.add(ItemFilter('Type',Colors.black,"type"));
                                  listFilter0.add(ItemFilter('Number of Islands',Colors.black,"numberofislands"));
                                  listFilter0.add(ItemFilter('Cabinet Style',Colors.black,"cabinetstyle"));
                                  listFilter0.add(ItemFilter('Cabinet Finish',Colors.black,"cabinetfinish"));
                                  listFilter0.add(ItemFilter('Counter Material',Colors.black,"countermaterial"));
                                  listFilter0.add(ItemFilter('Counter Color',Colors.black,"countercolor"));
                                  listFilter0.add(ItemFilter('Backplash Material',Colors.black,"blackpashmaterial"));
                                  listFilter0.add(ItemFilter('Appliance Finish',Colors.black,"appliance"));
                                  listFilter0.add(ItemFilter('Sink',Colors.black,"sink"));
                                  listFilter0.add(ItemFilter('Floor Material',Colors.black,"floormaterial"));
                                  listFilter0.add(ItemFilter('Floor Color',Colors.black,"floorcolor"));
                                  listFilter0.add(ItemFilter('Ceiling Design',Colors.black,"ceiling"));
                                }
                                break;

                                case "Exterior":{
                                  ConstListFiler();
                                  listFilter0.add(ItemFilter('Number of Stories',Colors.black,"numberofstories"));
                                  listFilter0.add(ItemFilter('Siding Material',Colors.black,"sidingmaterial"));
                                  listFilter0.add(ItemFilter('Siding Type',Colors.black,"sidingtype"));
                                  listFilter0.add(ItemFilter('House Color',Colors.black,"housecolor"));
                                  listFilter0.add(ItemFilter('Roof Type',Colors.black,"rooftype"));
                                  listFilter0.add(ItemFilter('Roof Material',Colors.black,"roofmaterial"));
                                  listFilter0.add(ItemFilter('Roof Color',Colors.black,"roofcolor"));
                                  listFilter0.add(ItemFilter('Building Type',Colors.black,"buidingtype"));
                                }
                                break;
                              }
                              if(mapFilter.containsKey(key)){
                                ItemFilter object2 = ItemFilter(mapFilter[key]?.text,Colors.black,"false");
                                int temp = list.indexOf(mapFilter[key]!);
                                list.insert(temp, object2);
                                list.removeAt(temp+1);
                              }
                              ItemFilter object = ItemFilter(list[index].text??"",AppColors.backgroundIntro , "true");
                              int k = list.indexOf(list[index]);
                              list.insert(k,object);
                              list.removeAt(k+1);
                              mapFilter[key] = list[index];
                              GetData();

                              ItemFilter object1 = ItemFilter(title, AppColors.backgroundIntro, key);
                              listFilter0.insert(num, object1);
                              listFilter0.removeAt(num+1);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 15,top: 15,bottom: 10,right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    list[index].text??"",
                                    style: TextStyle(
                                        color: list[index].color,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),

                                  Visibility(
                                    visible: list[index].key == "true"?true:false,
                                    child: Icon( IconData(0xe156, fontFamily: 'MaterialIcons'),color: list[index].color),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )),

                    InkWell(
                      onTap: (){
                        MapRemoveKey(key);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        color: Color.fromRGBO(244, 244, 244, 1),
                        child: Center(
                          child: Text(
                            'Deselect \"${title}\"',
                             style: TextStyle(
                               color: Color.fromRGBO(99, 99, 99, 1),
                               fontSize: 19,
                               fontWeight: FontWeight.w500
                             ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
    );
  }

  void MapRemoveKey(String key){
    mapFilter.remove(key);
    GetData();
    if(key == "room"){
      ConstListFiler();
    } else {
      for(int i=0; i < listFilter0.length;i++){
        if(listFilter0[i].key == key){
          listFilter0.insert(i, ItemFilter(listFilter0[i].text, Colors.black, key));
          listFilter0.removeAt(i+1);
        }
      }
    }
  }

  void HandleDesgnDetail(String id){
    Get.toNamed(AppRoutes.DESIGNDETAIL,parameters: {"id":id});
  }
}
