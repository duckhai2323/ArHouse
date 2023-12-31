import 'package:cloud_firestore/cloud_firestore.dart';

class UserClient {
  final String? id;
  final String? image;
  final String? fullname;
  final String? username;
  final String? birthday;
  final String? email;
  final String? password;
  final String? numberphone;
  final String? position;
  final String? address;
  final String? favorite;

  UserClient(this.id,this.image,this.fullname,this.username, this.birthday, this.email, this.password,
      this.numberphone, this.position,this.address,this.favorite);

  factory UserClient.fromFirestore(DocumentSnapshot<Map<String,dynamic>> snapshot,SnapshotOptions? options){
    final data = snapshot.data();
    return UserClient(
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

  Map<String,dynamic> toFirestore(){
    return {
      "id":id??"",
      "image":image??"",
      "fullname":fullname??"",
      "username":username??"",
      "birthday":birthday??"",
      "email":email??"",
      "password":password??"",
      "numberPhone":numberphone??"",
      "position":position??"",
      "address":address??"",
      "favorite":favorite??"",
    };
  }
}