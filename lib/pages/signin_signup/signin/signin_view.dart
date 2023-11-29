import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/signin_signup/signin/signin_controller.dart';

import '../../../colors/colors.dart';

class SignInPage extends GetView<SignInController>{

  @override
  Widget build(BuildContext context) {
    var text1Controller = TextEditingController();
    var text2Controller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: Colors.grey.withOpacity(0.3),
              height: 1,
            ),
          ),
          title: const Center(
            child: Text(
              'Sign In / Sign Up',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Roboto-Medium",
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
        ),
        body: Obx(()=>Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 125,
                  height: 110,
                  child: Image.asset(
                    'assets/images/logos/logo_app.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: text1Controller,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 14,fontFamily: "Roboto-Medium"),
                      prefixIcon: Icon(Icons.email_outlined,size: 23,color: Colors.grey),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child:TextField(
                    controller: text2Controller,
                    obscureText: controller.obscureText_.value,
                    keyboardType: TextInputType.visiblePassword,
                    decoration:InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 14,fontFamily: "Roboto-Medium"),
                      prefixIcon: Icon(Icons.lock_outline,size: 23,color: Colors.grey),
                      suffixIcon: InkWell(
                        onTap: (){
                          controller.ClickVisible();
                        },
                        child: Icon(controller.obscureText_.value?Icons.visibility_off:Icons.visibility,color: Colors.grey,size: 23,),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 12,
                ),

                InkWell(
                  onTap: (){
                    controller.HandleApplication(text1Controller.text,text2Controller.text);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color:AppColors.backgroundIntro,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0,1),
                          )
                        ]
                    ),
                    child:const Center(
                      child: Text(
                        'Khách hàng',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    controller.HandleApplicationAdmin(text1Controller.text,text2Controller.text);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color:AppColors.backgroundIntro,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0,1),
                          )
                        ]
                    ),
                    child:const Center(
                      child: Text(
                        'Nhân viên',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: InkWell(
                    onTap: (){
                      controller.HandlePageSignup();
                    },
                    child: Text(
                      'Bạn chưa có tài khoản? Đăng ký?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 35,
                ),

                const Text(
                  'HOẶC',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 28),
                  height: 38,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Image.asset(
                            'assets/images/logos/logo_google.png',
                            width: 22,
                            height: 22,
                          ),
                        ),
                        const Text(
                          'Tiếp tục với Google',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 20,),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 28),
                  height: 38,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Image.asset(
                            'assets/images/logos/logo_facebook.png',
                            width: 22,
                            height: 22,
                          ),
                        ),
                        const Text(
                          'Tiếp tục với Facebook',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 20,),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 28),
                  height: 38,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Image.asset(
                            'assets/images/logos/logo_twitter.png',
                            width: 22,
                            height: 22,
                          ),
                        ),
                        const Text(
                          'Tiếp tục với Twitter',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 20,),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        )),
      ),
    );
  }
}