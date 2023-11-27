import 'package:cloud_firestore/cloud_firestore.dart';

class News {
  final String? id;
  final String? title;
  final String? content;
  final List<String> images;
  final String? theme;
  final String? last_username;
  final String? last_comment;
  final DateTime? timestamp;

  News(this.id, this.title, this.content, this.images, this.theme,this.last_username,this.last_comment,this.timestamp);

  factory News.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options){
    final data = snapshot.data();
    return News(
      data?['id'] ?? "",
      data?['title'] ?? "",
      data?['content'] ?? "",
      List<String>.from(data?['images'] ?? []),
      data?['theme']??"",
      data?['last_username'] ?? "",
      data?['last_comment'] ?? "",
      (data?['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'images': List<String>.from(images ?? []),
      'theme': theme,
      'last_username':last_username,
      'last_comment':last_comment,
      'timestamp':timestamp,
    };
  }
}