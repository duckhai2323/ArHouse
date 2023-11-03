import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/colors/colors.dart';
import 'package:thietthach_app/pages/alldesign/itemfilter.dart';

class AllDesignController extends GetxController{
  List<ItemFilter> listFilter0 = <ItemFilter>[].obs;
  List<ItemFilter> list = <ItemFilter>[].obs;
  Map<String,ItemFilter> mapFilter = <String,ItemFilter>{}.obs;
  @override
  void onInit(){
    super.onInit();
    ConstListFiler();
  }

  void ConstListFiler(){
    listFilter0.clear();
    listFilter0.add(ItemFilter('Room',Colors.black,"Room"));
    listFilter0.add(ItemFilter('Style',Colors.black,"Style"));
    listFilter0.add(ItemFilter('Budget',Colors.black,"Budget"));
    listFilter0.add(ItemFilter('Size',Colors.black,"Size"));
    listFilter0.add(ItemFilter('Color',Colors.black,"Color"));
  }

  void ShowDialogFilter(BuildContext context, String key){
    if(!mapFilter.containsKey(key)){
      switch(key){
        case "Room":{
          list.clear();
          list.add( ItemFilter("Kitchen",Colors.black,"false"));
          list.add(ItemFilter("Bath",Colors.black,"false"));
          list.add(ItemFilter("Bedroom",Colors.black,"false"));
          list.add(ItemFilter("Living",Colors.black,"false"));
          list.add(ItemFilter("Dining",Colors.black,"false"));
          list.add(ItemFilter("Outdoor",Colors.black,"false"));
          list.add(ItemFilter("Baby&Kids",Colors.black,"false"));
          list.add(ItemFilter("HomeOffice",Colors.black,"false"));
          list.add(ItemFilter("Exterior",Colors.black,"false"));
          list.add(ItemFilter("Bedroom",Colors.black,"false"));
          list.add(ItemFilter("Living",Colors.black,"false"));
          list.add(ItemFilter("Dining",Colors.black,"false"));
          list.add(ItemFilter("Baby&Kids",Colors.black,"false"));
          list.add(ItemFilter("HomeOffice",Colors.black,"false"));
          list.add(ItemFilter("Exterior",Colors.black,"false"));
          DialogFilter(context,list,key);
        }
        break;
      }
    } else {
      DialogFilter(context,list,key);
    }
  }

  void DialogFilter(BuildContext context, List<ItemFilter> list,String key){
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
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Close',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 19,
                            ),
                          ),

                          Text(
                            key,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 19,
                            ),
                          ),

                          Text(
                            'Complete',
                            style: TextStyle(
                              color: AppColors.backgroundIntro,
                              fontWeight: FontWeight.w600,
                              fontSize: 19,
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
                              ConstListFiler();
                              switch(list[index].text){
                                case "Kitchen":{
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
                                  listFilter0.add(ItemFilter('Floor Color',Colors.black,"Floor Color"));
                                  listFilter0.add(ItemFilter('Ceiling Design',Colors.black,"ceiling"));
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

                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromRGBO(244, 244, 244, 1),
                      child: Center(
                        child: Text(
                          'Deselect \"Room\"',
                           style: TextStyle(
                             color: Color.fromRGBO(99, 99, 99, 1),
                             fontSize: 19,
                             fontWeight: FontWeight.w500
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
}