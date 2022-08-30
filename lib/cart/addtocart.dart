import 'package:floral/cart/card_message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../resources/firestore_methods.dart';

class AddToCart extends StatefulWidget {
  final cart_product;
  const AddToCart({Key? key, required this.cart_product}) : super(key: key);
  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool loaded = false;
  bool _order = false;
  int n = 0;
  void add() {
    setState(() {
      n++;
    });
  }

  void minus() {
    setState(() {
      if (n != 0) n--;
    });
  }

  DateTime? _selectedDate;
  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                                backgroundImage: NetworkImage(
                                    widget.cart_product['Photo Url'])
                                // AssetImage('assets/flower.png'),
                                ),
                            Text(
                              (widget.cart_product['Category']),
                              style: TextStyle(color: Colors.black),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        add();
                                      },
                                      icon: Icon(Icons.add_circle)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('$n'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      minus();
                                    },
                                    icon: Icon(Icons.cancel),
                                  )
                                ],
                              ),
                            )
                          ],
                        ));
                  }),
            ),
            Container(
              margin: EdgeInsets.all(9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      _presentDatePicker();
                    },
                    child: Text(
                      _selectedDate != null
                          ? DateFormat()
                              .add_yMEd()
                              .format(_selectedDate!)
                              .toString()
                          : 'Select the Date',
                      style: const TextStyle(fontSize: 22),
                      // '22/12/2022',
                      // style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 22,
                      //     fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => CardMessage()));
                },
                icon: Icon(
                  Icons.card_giftcard,
                  color: Colors.pink,
                ),
                label: Text(
                  'Card Message',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            // Container(
            //     margin: EdgeInsets.only(left: 9),
            //     child: Text(
            //       'Relevant Products',
            //       style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold),
            //     )),
            // Container(
            //   height: 160,
            //   width: MediaQuery.of(context).size.width,
            //   child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: 5,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Container(
            //             height: 100,
            //             child: Column(
            //               children: [
            //                 Card(
            //                     child: Image.asset(
            //                   'assets/download.png',
            //                   height: 100,
            //                   width: 100,
            //                   fit: BoxFit.cover,
            //                 )),
            //                 Text('Sparkling Image'),
            //                 Text('USD \$40')
            //               ],
            //             ),
            //           ),
            //         );
            //       }),
            // ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    loaded = true;
                  });
                  String result = await FirestoreMethods().cart(
                    date: DateFormat()
                        .add_yMEd()
                        .format(_selectedDate!)
                        .toString(),
                    category: widget.cart_product['Category'],
                    image: widget.cart_product['Photo Url'],
                    quantity: n.toString(),
                    order: _order,
                  );
                  if (result == 'success') {
                    debugPrint(result);
                    Navigator.pop(context);
                    setState(() {
                      loaded = false;
                    });
                  } else {
                    setState(() {
                      loaded = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(result),
                      duration: Duration(seconds: 10),
                    ));
                  }

                  //  Navigator.push(context, MaterialPageRoute(builder: (builder) => AddToCart()));
                },
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Color(0xff000000),
                    fixedSize: Size(200, 54)),
                child: loaded
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text(
                        "Place Order",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
