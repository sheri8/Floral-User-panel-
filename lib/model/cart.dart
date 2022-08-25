import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// final abc = Post;

class Cart {
  final String Date;
  final String Category;
  final ImageUrl;
  final String quantity;

  const Cart(
      {required this.Date,
      required this.Category,
      required this.ImageUrl,
      required this.quantity});

  Map<String, dynamic> toJson() => {
        'date': Date,
        'category': Category,
        'image url': ImageUrl,
        'quantity': quantity
      };

  static Cart fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Cart(
        Date: snapshot['Date'] ?? "",
        Category: snapshot['Category'] ?? "",
        ImageUrl: snapshot['ImageUrl'] ?? "",
        quantity: snapshot['Quantity'] ?? "");
  }
}
