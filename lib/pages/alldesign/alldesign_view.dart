import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/pages/alldesign/display_filter.dart';

import '../../colors/colors.dart';
import 'alldesign_controller.dart';
import 'filtertext_list.dart';

class AllDesignPage extends GetView<AllDesignController>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Icon(Icons.arrow_back_ios),
          ),
          backgroundColor:AppColors.backgroundColor,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(17),
            child: Container(
              color: Colors.grey.shade300,
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
                          style: TextStyle(fontSize: 16),
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
              Container(
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(250, 250, 250, 1),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      FilterWidget(),
                      FilterTextList(),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Text(
                  'All Photos (123)',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}