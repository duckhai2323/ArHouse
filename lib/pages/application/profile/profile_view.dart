import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/application/profile/profile_controller.dart';

import '../../../colors/colors.dart';

class ProfilePage extends GetView<ProfilerController>{

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.delay.isFalse?SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:AppColors.backgroundColor,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                InkWell(
                  onTap: (){
                    controller.SignOut(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child:Text(
                      'LogOut',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),

                const Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        FocusScope.of(context).unfocus();
                        controller.ClickUpdate();
                      },
                      child: const Text(
                        'Update',
                        style: TextStyle(
                            color: AppColors.backgroundIntro,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                  ],
                ),
              ],
            ),
          ),
        ),
        body:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Obx((){
            var dataProfile = controller.profile[0];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image(
                      image: const AssetImage('assets/images/noithat1.jpg'),
                      width: MediaQuery.sizeOf(context).width,
                      height: 250,
                      fit: BoxFit.cover,
                    ),

                    Positioned(
                      top: 80,
                      left: MediaQuery.sizeOf(context).width/2-55,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.borderColor,
                            width: 2.0,
                          ),
                        ),
                        child: Image(
                          image:CachedNetworkImageProvider(dataProfile.image!),
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Visibility(
                      visible: controller.loading.value,
                      child: Positioned(
                        top:20,
                        left: MediaQuery.sizeOf(context).width/2-15,
                        child: Container(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 50,
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.borderColor,
                            width: 2.0,
                          ),
                        ),
                        child: TextFormField(
                          controller: controller.textNameController,
                          style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Fullname',
                            hintStyle: TextStyle(fontSize: 17,color: Colors.grey,fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 50,
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.borderColor,
                            width: 2.0,
                          ),
                        ),
                        child: TextFormField(
                          controller: controller.textEmailController,
                          style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(fontSize: 17,color: Colors.grey,fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 50,
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.borderColor,
                            width: 2.0,
                          ),
                        ),
                        child: TextFormField(
                          controller: controller.textBirthdayController,
                          style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Birthday',
                            hintStyle: TextStyle(fontSize: 17,color: Colors.grey,fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 50,
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.borderColor,
                            width: 2.0,
                          ),
                        ),
                        child: TextFormField(
                          controller: controller.textNumberPhoneController,
                          style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Numberphone',
                            hintStyle: TextStyle(fontSize: 17,color: Colors.grey,fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 100,
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.borderColor,
                            width: 2.0,
                          ),
                        ),
                        child: TextFormField(
                          controller: controller.textAddressController,
                          style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Address',
                            hintStyle: TextStyle(fontSize: 17,color: Colors.grey,fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 100,
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.borderColor,
                            width: 2.0,
                          ),
                        ),
                        child: TextFormField(
                          controller: controller.textFavoriteController,
                          style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Favorite',
                            hintStyle: TextStyle(fontSize: 17,color: Colors.grey,fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            );
          } ),
        ),
      ),
    )
        :SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    )
    );
  }
}