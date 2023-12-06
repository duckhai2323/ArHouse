import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/colors/colors.dart';
import 'package:thietthach_app/pages/library/library_controller.dart';

class MenuLibrary extends GetView<LibraryController>{
  const MenuLibrary({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                width: MediaQuery.of(context).size.width/2-25,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: Offset(0, 2),
                      blurRadius: 3,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: (){
                    controller.HandleAllDesign();
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/icon4.png'),
                        width: 30,
                        height: 30,
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'All Designs',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width/2-25,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: Offset(0, 2),
                      blurRadius: 5,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/icon3.png'),
                      width: 30,
                      height: 30,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'Blog',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                width: MediaQuery.of(context).size.width/2-25,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 2),
                      blurRadius: 3,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/icon3.png'),
                      width: 30,
                      height: 30,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'Discussion',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width/2-25,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 2),
                      blurRadius: 5,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: 30,
                      color: Colors.black,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'Shopping',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}