import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:thietthach_app/documentObject/user.dart';

import '../../../routes/names.dart';

class SignInController extends GetxController{
  static late UserClient profile;
  var obscureText_ = true.obs;
  final db = FirebaseFirestore.instance;

  void ClickVisible(){
    if(obscureText_.value) {obscureText_.value = false;}
    else {obscureText_.value = true;}
  }
  void HandlePageSignup(){
    Get.toNamed(AppRoutes.SIGNUP);
  }
  Future<void> HandleApplication(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if(user!=null){
        String position = '';
        String id='';
        String image='';
        String username='';
        final data = db.collection("users")
            .where('email',isEqualTo: email)
            .get()
            .then((QuerySnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.docs.isNotEmpty) {
            for (DocumentSnapshot<Map<String, dynamic>> document in snapshot.docs) {
              Map<String, dynamic>? data = document.data();
              position = data?['position']??"";
              id = data?['id']??"";
              image = data?['image']??"";
              username = data?['username']??"";
              profile = UserClient(
                data?['id']??"",
                data?['image']??"",
                data?['fullname']??"",
                data?['username']??"",
                data?['birthday']??"",
                data?['email']??"",
                data?['password']??"",
                data?['numberphone']??"",
                data?['position']??"",
                data?['address']??"",
                data?['favorite']??"",
              );
            }
            Get.toNamed(AppRoutes.APPLICATION,parameters: {"position":position??"","id":id??"","image":image??"","username":username??""});
          } else {

          }
        }).catchError((error) {
          // Xử lý lỗi nếu có
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> HandleApplicationAdmin(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if(user!=null){
        String position = '';
        String id='';
        String image='';
        String username='';
        final data = db.collection("admins")
            .where('email',isEqualTo: email)
            .get()
            .then((QuerySnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.docs.isNotEmpty) {
            for (DocumentSnapshot<Map<String, dynamic>> document in snapshot.docs) {
              Map<String, dynamic>? data = document.data();
              position = data?['position']??"";
              id = data?['id']??"";
              image = data?['image']??"";
              username = data?['username']??"";
              profile = UserClient(
                data?['id']??"",
                data?['image']??"",
                data?['fullname']??"",
                data?['username']??"",
                data?['birthday']??"",
                data?['email']??"",
                data?['password']??"",
                data?['numberphone']??"",
                data?['position']??"",
                data?['address']??"",
                data?['favorite']??"",
              );
            }
            Get.toNamed(AppRoutes.APPLICATION,parameters: {"position":position??"","id":id??"","image":image??"","username":username??""});
          } else {

          }
        }).catchError((error) {
          // Xử lý lỗi nếu có
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}