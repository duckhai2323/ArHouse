import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/names.dart';

class SignInController extends GetxController{
  var obscureText_ = true.obs;
  final db = FirebaseFirestore.instance;

  void ClickVisible(){
    if(obscureText_.value) {obscureText_.value = false;}
    else {obscureText_.value = true;}
  }
  void HandlePageSignup(){
    //Get.toNamed(AppRoutes.SIGN_UP);
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
        String userId='';
        String image='';
        String fullname='';
        final data = db.collection("users")
            .where('email',isEqualTo: email)
            .get()
            .then((QuerySnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.docs.isNotEmpty) {
            for (DocumentSnapshot<Map<String, dynamic>> document in snapshot.docs) {
              Map<String, dynamic>? data = document.data();
              position = data?['position']??"";
              userId = data?['id']??"";
              image = data?['image']??"";
              fullname = data?['fullName']??"";
            }
            Get.toNamed(AppRoutes.APPLICATION,parameters: {"position":position??"","userId":userId??"","image":image??"","fullname":fullname??""});
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