import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Product {
  final String? id;
  final String? title;
  final String? price;
  final List<String> images;
  final List<String> userlike;
  final DateTime? timestamp;

  Product(this.id,this.title,this.price,this.images,this.userlike,this.timestamp);

  factory Product.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options){
    final data = snapshot.data();
    return Product(
      data?['id']??"",
      data?['title']??"",
      data?['price']??"",
      List<String>.from(data?['images']??[]),
      List<String>.from(data?['userlike']??[]),
      (data?['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id ?? "",
      'title': title ?? "",
      'price': price ?? "",
      'images': List<String>.from(images ?? []),
      'userlike': List<String>.from(userlike ?? []),
      'timestamp':timestamp,
    };
  }

}