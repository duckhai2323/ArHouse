import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/products/display_products.dart';
import 'package:thietthach_app/pages/products/products_controller.dart';

import '../../colors/colors.dart';

class ProductsPage extends GetView<ProductsController>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:AppColors.backgroundColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(5),
            child: Container(
              color: Colors.grey.withOpacity(0.3),
              height: 1,
            ),
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 20),
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
                  'Products',
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

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DisplayProducts(),
            ],
          ),
        ),
      ),
    );
  }
}