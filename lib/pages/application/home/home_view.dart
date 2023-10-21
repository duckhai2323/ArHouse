import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/application/home/home_controller.dart';

import '../../../colors/colors.dart';

class HomePage extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.backgroundColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
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
                          prefixIcon: Icon(Icons.search,color: AppColors.iconColor,size: 30,),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.searchColor,width: 1),
                          ),
                          focusedBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.searchColor),
                          ),
                          hintText: 'Tìm kiếm môn học',
                          hintStyle: const TextStyle(color: AppColors.iconColor,fontWeight: FontWeight.w500,),
                        ),
                        onTap: (){
                        },
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/logo1.png'),
                        height: 48,
                        width: 48,
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                      ),

                      Text(
                        'Thư viện',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/logo2.png'),
                        height: 48,
                        width: 48,
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                      ),

                      Text(
                          'Chi phí',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/logo3.png'),
                        height: 48,
                        width: 48,
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                      ),

                      Text(
                          'Sản phẩm',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/logo4.png'),
                        height: 48,
                        width: 48,
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                      ),

                      Text(
                          'Kiến thức',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(),
    );
  }
}