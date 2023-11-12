import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/signin_signup/signup/signup_controller.dart';

import '../../../colors/colors.dart';

class SignUpPage extends GetView<SignUpController>{
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var FullName = TextEditingController();
  var Birthday = TextEditingController();
  var PasswordConfirm = TextEditingController();
  var TelePhone = TextEditingController();

  SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: Colors.grey.withOpacity(0.3),
              height: 1,
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                iconSize: 30,
                color: AppColors.backgroundIntro,
                onPressed: (){
                  Get.back();
                },
              ),
              const Text(
                'Đăng ký',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Roboto-Medium",
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
        body: Obx(()=>SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15,bottom: 10),
                child: Center(
                  child: InkWell(
                    onTap: (){
                      controller.PickImage();
                    },
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 53,
                          backgroundColor: AppColors.logoColor,
                          child: controller.checkClickImage.value == false?
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/images/avatar0.jpg'),
                          ):
                          ClipOval(child: Image.file(controller.image.value,fit: BoxFit.cover,width: 100,height: 100,)),
                        ),
                        const Positioned(
                          bottom: 0,
                          right: 3,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.backgroundIntro,
                            child: CircleAvatar(
                              radius: 13,
                              backgroundColor: AppColors.backgroundColor,
                              child: Icon(Icons.camera_alt,size: 22,color: Colors.grey,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 20,top: 20),
                child: Text(
                  '* Thông tin cơ bản:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child: TextField(
                  controller: FullName,
                  decoration: InputDecoration(
                    hintText: 'Họ và Tên',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14,fontFamily: "Roboto-Medium"),
                    prefixIcon: Icon(Icons.person_outlined,size: 23,color: Colors.grey),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child: TextField(
                  controller: Birthday,
                  decoration: InputDecoration(
                    hintText: 'Ngày sinh',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14,fontFamily: "Roboto-Medium"),
                    prefixIcon: Icon(Icons.calendar_month,size: 23,color: Colors.grey),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child: TextField(
                  controller: TelePhone,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Số điện thoại',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14,fontFamily: "Roboto-Medium"),
                    prefixIcon: Icon(Icons.numbers,size: 23,color: Colors.grey),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child: TextField(
                  controller: EmailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14,fontFamily: "Roboto-Medium"),
                    prefixIcon: Icon(Icons.mail_outline,size: 23,color: Colors.grey),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child:TextField(
                  controller: PasswordController,
                  obscureText: controller.obscureText1_.value,
                  keyboardType: TextInputType.visiblePassword,
                  decoration:InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14,fontFamily: "Roboto-Medium"),
                    prefixIcon: Icon(Icons.lock_outline,size: 23,color: Colors.grey),
                    suffixIcon: InkWell(
                      onTap: (){
                        controller.ClickVisible1();
                      },
                      child: Icon(controller.obscureText1_.value?Icons.visibility_off:Icons.visibility,color: Colors.grey,size: 23,),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child:TextField(
                  controller: PasswordConfirm,
                  obscureText: controller.obscureText2_.value,
                  keyboardType: TextInputType.visiblePassword,
                  decoration:InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14,fontFamily: "Roboto-Medium"),
                    prefixIcon: Icon(Icons.lock_outline,size: 23,color: Colors.grey),
                    suffixIcon: InkWell(
                      onTap: (){
                        controller.ClickVisible2();
                      },
                      child: Icon(controller.obscureText2_.value?Icons.visibility_off:Icons.visibility,color: Colors.grey,size: 23,),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: GestureDetector(
                  onTap: (){
                    controller.CreateUserWithEmailAndPassword(EmailController.text, PasswordController.text);
                    controller.PushDataUser(FullName.text, Birthday.text, EmailController.text, PasswordController.text, TelePhone.text);
                    controller.HandlePageSignIn();
                  },
                  child: Container(
                    height: 43,
                    decoration: BoxDecoration(
                        color: AppColors.backgroundIntro,
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0,1),
                          )
                        ]
                    ),
                    child: const Center(
                      child: Text(
                        'Đăng ký',
                        style: TextStyle(
                          color: AppColors.textIntroColor,
                          fontWeight:FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                ),
              ),
            ],
          ),
        ),),
      ),
    );
  }
}