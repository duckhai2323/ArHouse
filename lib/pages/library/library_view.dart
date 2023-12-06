import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/pages/library/display_design.dart';
import 'package:thietthach_app/pages/library/library_controller.dart';
import 'package:thietthach_app/pages/library/menu.dart';

import '../../colors/colors.dart';

class LibraryPage extends GetView<LibraryController>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: InkWell(onTap:(){Navigator.pop(context);},child: const Icon(Icons.arrow_back_ios)),
          ),
          backgroundColor:AppColors.backgroundColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(17),
            child: Container(
              height: 1,
            ),
          ),
          flexibleSpace: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 15,left: 60,right: 15),
                        child: TextField(
                          style: const TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 3,left: 10),
                            filled: true,
                            fillColor: AppColors.searchColor,
                            prefixIcon: const Icon(Icons.search,color: AppColors.iconColor,size: 30,),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: const BorderSide(color: AppColors.searchColor,width: 1),
                            ),
                            focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: const BorderSide(color: AppColors.searchColor),
                            ),
                            hintText: 'Search',
                            hintStyle: const TextStyle(color: AppColors.iconColor,fontWeight: FontWeight.w500,),
                          ),
                        ),
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.shopping_cart_outlined,color: AppColors.iconColor,size: 30,),
                        SizedBox(width: 10,),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MenuLibrary(),
              const Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10,top: 5,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'ArHouse Design',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),

                    Text(
                      'Fliter',
                      style: TextStyle(
                        color: AppColors.backgroundIntro,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(width: 5,),

                    Icon(Icons.menu_open,size: 30,color: AppColors.backgroundIntro,)
                  ],
                ),
              ),
              DisplayDesign()
            ],
          ),
        )
      ),
    );
  }
}