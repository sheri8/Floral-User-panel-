import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floral/model/cart_message.dart';
import 'package:floral/resources/storage_method.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../model/cart.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> cart_message({
    required String cart_message,
    required String feeling,
    // required String date
  }) async {
    String res = "Some error occured";
    var uuid = Uuid().v1();

    try {
      CartMessage Cart_Message =
          CartMessage(Cart_Message: cart_message, Feeling: feeling);
      //  Post post = Post(Cart_Message: cart_message, Feeling: feeling, Date: date
      //       // DateFormat().add_yMEd().format(date).toString(),
      //       );

      await _firestore
          .collection('cart_message')
          .doc(uuid)
          .set(Cart_Message.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> cart({
    required String date,
    required String category,
    required String image,
    required String quantity,
    required bool order,
  }) async {
    String res = "Some error occured";
    var uuid = Uuid().v1();

    try {
      String photUrl = image;
      // await StorageMethods().uploadImageToStorage('Snap', !, true);
      String postId = const Uuid().v1();
      Cart cart = Cart(
        Date: date,
        Category: category,
        ImageUrl: photUrl,
        quantity: quantity,
        uuid: uuid,
        order: 'pending',
      );
      //  Post post = Post(Cart_Message: cart_message, Feeling: feeling, Date: date
      //       // DateFormat().add_yMEd().format(date).toString(),
      //       );

      await _firestore.collection('cart').doc(uuid).set(cart.toJson());
      res = "success";
    } on FirebaseAuthException catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> deletePost(String postId) async {
    // String res = "Some error occurred";
    try {
      await _firestore.collection('posts').doc(postId).delete();
      // res = 'success';
    } catch (err) {
      print(err.toString());
      // res = err.toString();
    }
    // return res;
  }

  //
}
