import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/application/favorite/displaydesigns.dart';
import 'package:thietthach_app/pages/application/favorite/displayproducts.dart';
import 'package:thietthach_app/pages/application/favorite/facvorite_controller.dart';

import '../../../colors/colors.dart';

class FavoritePage extends GetView<FavoriteController>{

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Designs'),
    Tab(text: 'Products'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:DefaultTabController(
          length: myTabs.length,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor:AppColors.backgroundColor,
              bottom: const TabBar(
                labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AppColors.backgroundIntro,
                indicatorColor: AppColors.backgroundIntro,
              tabs: myTabs,
            ),
              flexibleSpace: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    InkWell(
                      onTap: (){
                        //Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Icon(Icons.search,color: AppColors.iconColor,size: 30,),
                      ),
                    ),

                    const Text(
                      'My Favorite',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
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
              ),
            ),

            body: TabBarView(
              children: [
                DisplayImage(),
                DisplayProducts(),
              ],
            ),
          )
      )
    );
  }
}