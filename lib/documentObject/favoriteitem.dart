import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteItem{
  final String? id;
  final String? id_blog;
  final String? image;
  final String? note;
  final DateTime? timestamp;

  FavoriteItem(this.id,this.id_blog,this.image,this.note,this.timestamp);

  factory FavoriteItem.fromFirestore(DocumentSnapshot<Map<String,dynamic>> snapshot,SnapshotOptions? options){
    final data = snapshot.data();
    return FavoriteItem(
      data?['id']??"",
      data?['id_blog']??"",
      data?['image']??"",
      data?['note']??"",
      (data?['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String,dynamic> toFirestore(){
    return {
      "id":id??"",
      "id_blog":id_blog??"",
      "image":image??"",
      "note":note??"",
      'timestamp':timestamp,
    };
  }
}