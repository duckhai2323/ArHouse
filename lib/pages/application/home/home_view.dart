import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/application/home/display_blog.dart';
import 'package:thietthach_app/pages/application/home/display_infor.dart';
import 'package:thietthach_app/pages/application/home/display_interior.dart';
import 'package:thietthach_app/pages/application/home/display_shop.dart';
import 'package:thietthach_app/pages/application/home/home_controller.dart';

import '../../../colors/colors.dart';

class HomePage extends GetView<HomeController>{
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:AppColors.backgroundColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Container(
            color: Colors.grey.withOpacity(0.3),
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
                      padding: const EdgeInsets.only(top: 10,bottom: 15,left: 10,right: 10),
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: (){
                      controller.HandlePageLibrary();
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/logo1.png'),
                          height: 45,
                          width: 45,
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                        ),

                        /*Text(
                          'Library',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),
                        ),*/
                      ],
                    ),
                  ),

                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/logo2.png'),
                        height: 45,
                        width: 45,
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                      ),

                      /*Text(
                          'Expenses',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),*/
                    ],
                  ),

                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/logo3.png'),
                        height: 45,
                        width: 45,
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                      ),

                      /*Text(
                          'Products',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),*/
                    ],
                  ),

                  InkWell(
                    onTap: (){
                      controller.HandleKnowledge();
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/logo4.png'),
                          height: 45,
                          width: 45,
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                        ),

                        /*Text(
                            'Discussion',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*const Padding(
              padding: EdgeInsets.only(left: 10.0,right: 10,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'ArHouse Company',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),

                  Text(
                    'See All',
                    style: TextStyle(
                      color: AppColors.backgroundIntro,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Icon(Icons.arrow_forward_ios,size: 16,color: AppColors.backgroundIntro,)
                ],
              ),
            ),*/

            //InforCompany(),

            const Padding(
              padding: EdgeInsets.only(left: 10.0,right: 10,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Shop by Department',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),

                  Text(
                    'See All',
                    style: TextStyle(
                      color: AppColors.backgroundIntro,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Icon(Icons.arrow_forward_ios,size: 16,color: AppColors.backgroundIntro,)
                ],
              ),
            ),

            ShopDepartment(),
            //InteriorList(),

            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Interior Design',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      controller.HandleAllDesign();
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: AppColors.backgroundIntro,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const Icon(Icons.arrow_forward_ios,size: 16,color: AppColors.backgroundIntro,)
                ],
              ),
            ),

            //ShopDepartment(),
            const InteriorList(),
            BlogList(),
          ],
        ),
      ),
    );
  }
}