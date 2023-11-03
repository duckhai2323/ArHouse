import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/colors/colors.dart';
import 'package:thietthach_app/pages/alldesign/itemfilter.dart';

class AllDesignController extends GetxController{
  List<ItemFilter> listFilter0 = <ItemFilter>[].obs;
  List<ItemFilter> listFilter1 = <ItemFilter>[].obs;
  List<ItemFilter> listFilter2 = <ItemFilter>[].obs;
  @override
  void onInit(){
    super.onInit();
    listFilter1.add(ItemFilter('Room',Colors.black,"room"));
    listFilter1.add(ItemFilter('Style',Colors.black,"style"));
    listFilter1.add(ItemFilter('Budget',Colors.black,"budget"));
    listFilter1.add(ItemFilter('Size',Colors.black,"size"));
    listFilter1.add(ItemFilter('Color',Colors.black,"color"));
    listFilter0 = List.from(listFilter1);
  }

  void ShowDialogFilter(BuildContext context, String key){
    switch(key){
      case "room":{
        List<String> list = [];
        list.add("Kitchen");
        list.add("Bath");
        list.add("Bedroom");
        list.add("Living");
        list.add("Dining");
        list.add("Outdoor");
        list.add("Baby&Kids");
        list.add("HomeOffice");
        list.add("Exterior");
        list.add("Bedroom");
        list.add("Living");
        list.add("Dining");
        list.add("Outdoor");
        list.add("Baby&Kids");
        list.add("HomeOffice");
        list.add("Exterior");
        DialogFilter(context,list,'Room',key);
      }
      break;
    }
  }

  void DialogFilter(BuildContext context, List<String> list,String title,String key){
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
                            title,
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

                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (_,index){
                          return InkWell(
                            onTap: (){
                              listFilter2.clear();
                              listFilter0.clear();
                              listFilter2.add(ItemFilter('Layout',Colors.black,"layout"));
                              listFilter2.add(ItemFilter('Type',Colors.black,"type"));
                              listFilter2.add(ItemFilter('Number of Islands',Colors.black,"numberofislands"));
                              listFilter2.add(ItemFilter('Cabinet Style',Colors.black,"cabinetstyle"));
                              listFilter2.add(ItemFilter('Cabinet Finish',Colors.black,"cabinetfinish"));
                              listFilter2.add(ItemFilter('Counter Material',Colors.black,"countermaterial"));
                              listFilter2.add(ItemFilter('Counter Color',Colors.black,"countercolor"));
                              listFilter2.add(ItemFilter('Backplash Material',Colors.black,"blackpashmaterial"));
                              listFilter2.add(ItemFilter('Appliance Finish',Colors.black,"appliance"));
                              listFilter2.add(ItemFilter('Sink',Colors.black,"sink"));
                              listFilter2.add(ItemFilter('Floor Material',Colors.black,"floormaterial"));
                              listFilter2.add(ItemFilter('Floor Color',Colors.black,"Floor Color"));
                              listFilter2.add(ItemFilter('Ceiling Design',Colors.black,"ceiling"));
                              listFilter0 = listFilter1 + listFilter2;
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 15,top: 15,bottom: 10),
                              child: Text(
                                list[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

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