import 'package:cloud_firestore/cloud_firestore.dart';

class House {
  final String? id;
  final String? token;
  final String? title;
  final String? content;
  final List<String> images;
  final String? style;
  final String? budget;
  final String? color;
  final String? size;
  final DateTime? timestamp;
  final String? room;
  final String? admin;
  final List<String> userlike;

  House(this.id,this.token, this.title, this.content, this.images, this.style, this.budget,
      this.color, this.size,this.timestamp,this.room,this.admin,this.userlike);

  factory House.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options){
    final data = snapshot.data();
    return House(
      data?['id'] ?? "",
      data?['token']??"",
      data?['title'] ?? "",
      data?['content'] ?? "",
      List<String>.from(data?['images'] ?? []),
      data?['style'] ?? "",
      data?['budget'] ?? "",
      data?['color'] ?? "",
      data?['size'] ?? "",
      (data?['timestamp'] as Timestamp).toDate(),
      data?['room']??"",
      data?['admin']??"",
      List<String>.from(data?['userlike'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id ?? "",
      'token':token??"",
      'title': title ?? "",
      'content': content ?? "",
      'images': List<String>.from(images ?? []),
      'style': style ?? "",
      'budget': budget ?? "",
      'color': color ?? "",
      'size': size ?? "",
      'timestamp':timestamp,
      'room':room??"",
      'admin':admin??"",
      'userlike': List<String>.from(userlike ?? []),
    };
  }
}
