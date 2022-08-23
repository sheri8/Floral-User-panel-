import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floral/main/orders/myorder.dart';
import 'package:floral/main/profile/myacccount.dart';
import 'package:floral/widgets/Drawer%20Products/trouser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Floral",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      Text(
                        "With Love",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )
                    ],
                  ),
                  Image.asset(
                    'assets/flower.png',
                    width: 100,
                    height: 60,
                  )
                ],
              ),
            ),
            Center(
              child: ListTile(
                leading: Icon(
                  Icons.category,
                  color: Colors.black,
                ),
                title: Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            categories('Shirt', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => Trouser(
                            category: 'Shirt',
                          )));
            }),
            categories('Pent', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => Trouser(
                            category: 'Pent',
                          )));
            }),
            categories('Shoes', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => Trouser(
                            category: 'Shoes',
                          )));
            }),
            categories('Belt', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => Trouser(
                            category: 'Belt',
                          )));
            }),
            categories('Computer', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => Trouser(
                            category: 'Computer',
                          )));
            }),
            categories('Charger', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => Trouser(
                            category: 'Charger',
                          )));
            }),
            categories('Purse', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => Trouser(
                            category: 'Purse',
                          )));
            }),
            categories('Perfumes', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => Trouser(
                            category: 'Perfumes',
                          )));
            }),
            categories('Trouser', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => Trouser(
                            category: 'Trouser',
                          )));
            }),
            // StreamBuilder(
            //     stream: FirebaseFirestore.instance
            //         .collection('Order')

            //         // .orderBy('Shirt', descending: true)
            //         .snapshots(),
            //     // .take(9),
            //     builder: (context,
            //         AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
            //             snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //       return SizedBox(
            //         height: 500,
            //         child: ListView.builder(
            //             itemCount: snapshot.data!.docs.length,
            //             itemBuilder: (BuildContext context, int index) {
            //               return InkWell(
            //                   onTap: () {
            //                     Navigator.push(
            //                         context,
            //                         MaterialPageRoute(
            //                             builder: (builder) => Trouser(
            //                                 snap2: snapshot.data!.docs[index]
            //                                     .data())));
            //                   },
            //                   child: ListTile(
            //                     title: Text(
            //                         snapshot.data!.docs[index]['Category']),
            //                   ));
            //             }),
            //       );
            //     }),
            Center(
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => MyProfile()));
                },
                leading: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                title: Text(
                  'My Account',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Center(
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => MyOrders()));
                },
                leading: Icon(
                  Icons.add_box,
                  color: Colors.black,
                ),
                title: Text(
                  'My Orders',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Center(
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile categories(String title, VoidCallback Function) {
    return ListTile(
      onTap: Function,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
      ),
    );
  }
}
