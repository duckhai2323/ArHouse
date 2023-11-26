import 'package:cloud_firestore/cloud_firestore.dart';

import 'house.dart';

class Exterior extends House{
  final String? numberofstories;
  final String? sidingmaterial;
  final String? sidingtype;
  final String? housecolor;
  final String? rooftype;
  final String? roofmaterial;
  final String? roofcolor;
  final String? buildingtype;

  Exterior(
      String id,
      String token,
      String title,
      String content,
      List<String> images,
      String style,
      String budget,
      String color,
      String size,
      DateTime timestamp,
      String room,
      List<String> userlike,
  {
    this.numberofstories,
    this.sidingmaterial,
    this.sidingtype,
    this.housecolor,
    this.rooftype,
    this.roofmaterial,
    this.roofcolor,
    this.buildingtype
  }
      ):super(id,token,title,content,images,style,budget,color,size,timestamp,room,userlike);

  factory Exterior.fromFirestore(DocumentSnapshot<Map<String,dynamic>> snapshot,SnapshotOptions? options){
    final data = snapshot.data();
    return Exterior(
      data?['id']??"",
      data?['token']??"",
      data?['title']??"",
      data?['content']??"",
      List<String>.from(data?['images'] ?? []),
      data?['style']??"",
      data?['budget']??"",
      data?['color']??"",
      data?['size']??"",
      (data?['timestamp'] as Timestamp).toDate(),
      data?['room']??"",
      List<String>.from(data?['userlike'] ?? []),
      numberofstories: data?['numberofstories'],
      sidingmaterial: data?['sidingmaterial'],
      sidingtype: data?['sidingtype'],
      housecolor: data?['housecolor'],
      rooftype: data?['rooftype'],
      roofmaterial: data?['roofmaterial'],
      roofcolor: data?['roofcolor'],
      buildingtype: data?['buildingtype'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': super.id ?? "",
      'token':super.token??"",
      'title': super.title ?? "",
      'content': super.content ?? "",
      'images': List<String>.from(super.images ?? []),
      'style': super.style ?? "",
      'budget': super.budget ?? "",
      'color': super.color ?? "",
      'size': super.size ?? "",
      'timestamp':super.timestamp,
      'room':super.room,
      'userlike': List<String>.from(super.userlike ?? []),
      'numberofstories': numberofstories ?? null,
      'sidingmaterial': sidingmaterial ?? "",
      'sidingtype': sidingtype ?? "",
      'housecolor': housecolor ?? "",
      'rooftype': rooftype ?? "",
      'roofmaterial': roofmaterial ?? "",
      'roofcolor': roofcolor ?? "",
      'buildingtype': buildingtype ?? "",
    };
  }
}