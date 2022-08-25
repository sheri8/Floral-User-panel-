import 'package:cloud_firestore/cloud_firestore.dart';

class CartMessage {
  final String? Cart_Message;
  final String? Feeling;
  // final String Date;

  const CartMessage({
    required this.Cart_Message,
    required this.Feeling,
    // required this.Date,
  });

  Map<String, dynamic> toJson() =>
      {"cart_message": Cart_Message, "feelings": Feeling};

  static CartMessage fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return CartMessage(
        Cart_Message: snapshot['Cart_Message'] ?? "",
        Feeling: snapshot['Feeling'] ?? "");
  }
}
