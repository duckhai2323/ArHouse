import 'package:cloud_firestore/cloud_firestore.dart';

class House {
  final String? id;
  final String? title;
  final String? content;
  final List<String> images;
  final String? style;
  final String? budget;
  final String? color;
  final String? size;
  final DateTime? timestamp;
  final String? room;

  House(this.id, this.title, this.content, this.images, this.style, this.budget,
      this.color, this.size,this.timestamp,this.room);

  factory House.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options){
    final data = snapshot.data();
    return House(
      data?['id'] ?? "",
      data?['title'] ?? "",
      data?['content'] ?? "",
      List<String>.from(data?['images'] ?? []),
      data?['style'] ?? "",
      data?['budget'] ?? "",
      data?['color'] ?? "",
      data?['size'] ?? "",
      (data?['timestamp'] as Timestamp).toDate(),
      data?['room']??"",
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id ?? "",
      'title': title ?? "",
      'content': content ?? "",
      'images': List<String>.from(images ?? []),
      'style': style ?? "",
      'budget': budget ?? "",
      'color': color ?? "",
      'size': size ?? "",
      'timestamp':timestamp,
      'room':room??"",
    };
  }
}
