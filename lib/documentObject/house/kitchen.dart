import 'package:cloud_firestore/cloud_firestore.dart';

import 'house.dart';

class Kitchen extends House{
  final String? layout;
  final String? type;
  final String? numberofislands;
  final String? cabinetstyle;
  final String? cabinetfinish;
  final String? countermaterial;
  final String? countercolor;
  final String? backsplashcolor;
  final String? appliancefinish;
  final String? sink;
  final String? floormaterial;
  final String? floorcolor;
  final String? ceilingdesign;

  Kitchen(
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
      String admin,
      List<String> userlike,
      {
        this.layout,
        this.type,
        this.numberofislands,
        this.cabinetstyle,
        this.cabinetfinish,
        this.countermaterial,
        this.countercolor,
        this.backsplashcolor,
        this.appliancefinish,
        this.sink,
        this.floormaterial,
        this.floorcolor,
        this.ceilingdesign,
      }
      ):super(id,token,title,content,images,style,budget,color,size,timestamp,room,admin,userlike);

  factory Kitchen.fromFirestore(DocumentSnapshot<Map<String,dynamic>> snapshot,SnapshotOptions? options){
    final data = snapshot.data();
    return Kitchen(
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
      data?['admin']??"",
      List<String>.from(data?['userlike'] ?? []),
      layout: data?['layout'],
      type: data?['type'],
      numberofislands: data?['numberofislands'],
      cabinetstyle: data?['cabinetstyle'],
      cabinetfinish: data?['cabinetfinish'],
      countermaterial: data?['countermaterial'],
      countercolor: data?['countercolor'],
      backsplashcolor: data?['backsplashcolor'],
      appliancefinish: data?['appliancefinish'],
      sink: data?['sink'],
      floormaterial: data?['floormaterial'],
      floorcolor: data?['floorcolor'],
      ceilingdesign: data?['ceilingdesign'],
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
      'admin':super.admin,
      'userlike': List<String>.from(super.userlike ?? []),
      'layout': layout ?? null,
      'type': type ?? "",
      'numberofislands': numberofislands ?? "",
      'cabinetstyle': cabinetstyle ?? "",
      'cabinetfinish': cabinetfinish ?? "",
      'countermaterial': countermaterial ?? "",
      'countercolor': countercolor ?? "",
      'backsplashcolor': backsplashcolor ?? "",
      'appliancefinish': appliancefinish ?? "",
      'sink': sink ?? "",
      'floormaterial': floormaterial ?? "",
      'floorcolor': floorcolor ?? "",
      'ceilingdesign': ceilingdesign ?? "",
    };
  }
}