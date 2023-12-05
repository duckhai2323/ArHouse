
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/documentObject/user.dart';
import 'package:thietthach_app/pages/application/application_controller.dart';
import 'package:thietthach_app/pages/signin_signup/signin/signin_controller.dart';

class ProfilerController extends GetxController{
  var textNameController = TextEditingController();
  var textEmailController = TextEditingController();
  var textBirthdayController = TextEditingController();
  var textNumberPhoneController = TextEditingController();
  var textAddressController = TextEditingController();
  var textFavoriteController = TextEditingController();

  var db = FirebaseFirestore.instance;
  List<UserClient> profile = <UserClient>[].obs;
  var delay = true.obs;
  var loading = false.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    GetProfile(ApplicationController.id);
  }
  Future<void> GetProfile(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    if(SignInController.profile.position == "client"){
      final data = await db.collection("users").withConverter(
          fromFirestore: UserClient.fromFirestore,
          toFirestore: (UserClient userClient, options) => userClient.toFirestore()
      ).where("id",isEqualTo:id).get();
      if(data.docs.isNotEmpty){
        profile.add(data.docs[0].data());
        textNameController = TextEditingController(text: profile[0].fullname);
        textEmailController  = TextEditingController(text: profile[0].email);
        textBirthdayController = TextEditingController(text: profile[0].birthday);
        textNumberPhoneController = TextEditingController(text: profile[0].numberphone);
        textFavoriteController = TextEditingController(text: profile[0].favorite);
        textAddressController = TextEditingController(text: profile[0].address);
        delay.value = false;
      }
    } else {
      final data = await db.collection("admins").withConverter(
          fromFirestore: UserClient.fromFirestore,
          toFirestore: (UserClient userClient, options) => userClient.toFirestore()
      ).where("id",isEqualTo:id).get();
      if(data.docs.isNotEmpty){
        profile.add(data.docs[0].data());
        textNameController = TextEditingController(text: profile[0].fullname);
        textEmailController  = TextEditingController(text: profile[0].email);
        textBirthdayController = TextEditingController(text: profile[0].birthday);
        textNumberPhoneController = TextEditingController(text: profile[0].numberphone);
        textFavoriteController = TextEditingController(text: profile[0].favorite);
        textAddressController = TextEditingController(text: profile[0].address);
        delay.value = false;
      }
    }
  }

  Future<void> UpdateProfile(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    if(SignInController.profile.position == "client"){
      await db.collection("users").doc(id).update({
        "fullname":textNameController.text.toString()??"",
        "birthday":textBirthdayController.text.toString()??"",
        "email":textEmailController.text.toString()??"",
        "numberPhone":textNumberPhoneController.text.toString()??"",
        "address":textAddressController.text.toString()??"",
        "favorite":textFavoriteController.text.toString()??"",
      });
    }else {
      await db.collection("admins").doc(id).update({
        "fullname":textNameController.text.toString()??"",
        "birthday":textBirthdayController.text.toString()??"",
        "email":textEmailController.text.toString()??"",
        "numberPhone":textNumberPhoneController.text.toString()??"",
        "address":textAddressController.text.toString()??"",
        "favorite":textFavoriteController.text.toString()??"",
      });
    }
  }

  void ClickUpdate() async {
    loading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    UpdateProfile(ApplicationController.id);
    loading.value = false;
  }

  void SignOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pop(context);
  }
}