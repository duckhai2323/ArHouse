import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/colors/colors.dart';
import 'package:thietthach_app/pages/alldesign/itemfilter.dart';

class AllDesignController extends GetxController{
  List<ItemFilter> listFilter0 = <ItemFilter>[].obs;
  @override
  void onInit(){
    super.onInit();
    ConstListFilter();
  }

  void ConstListFilter(){
    listFilter0.clear();
    listFilter0.add(ItemFilter('Room',Colors.black,"room"));
    listFilter0.add(ItemFilter('Style',Colors.black,"style"));
    listFilter0.add(ItemFilter('Budget',Colors.black,"budget"));
    listFilter0.add(ItemFilter('Size',Colors.black,"size"));
    listFilter0.add(ItemFilter('Color',Colors.black,"color"));
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
                              ConstListFilter();
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