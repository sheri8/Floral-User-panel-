import 'package:floral/cart/addtocart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductDescription extends StatefulWidget {
  final snap;
  ProductDescription({this.snap});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.snap['Photo Url'],
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            Container(
                margin: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Product Name: ${widget.snap['Name']}',
                  style: TextStyle(color: Colors.black),
                )),
            Container(
                margin: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Retail Price: ${widget.snap['Price']} USD',
                  style: TextStyle(color: Colors.black),
                )),
            Container(
                margin: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Description',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                )),
            Container(
                margin: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Text(
                  widget.snap['Description'],
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 20,
            ),
            Center(
                child: ElevatedButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) =>
                            AddToCart(cart_product: widget.snap)));
              },
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff000000), fixedSize: Size(300, 54)),
              child: Text(
                "Add To Cart",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
