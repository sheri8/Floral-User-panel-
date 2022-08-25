import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floral/main/description/productdescription.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Trouser extends StatefulWidget {
  String category;
  // final snap2;
  Trouser({Key? key, required this.category}) : super(key: key);

  @override
  State<Trouser> createState() => _TrouserState();
}

class _TrouserState extends State<Trouser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          // widget.category['Category'],
          widget.category,

          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 179, 178, 178)),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Order')
              .where("Category", isEqualTo: widget.category)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  print(data.toString());
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => ProductDescription(
                                    snap: data,
                                  )));
                    },
                    leading: SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.network(
                        data['Photo Url'],
                        // ['Photo Url'],
                        // snapshot.data!.docs[index]['Photo Url'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      data['Category'],
                      // ['Category'],

                      // snapshot.data!.docs[index]['Categroy'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      data['Color'],
                      // ['Name'],

                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    trailing: Text(
                      '\$ ${data['Price']}',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  );
                }).toList(),
              ),
            );
          }),
    );
  }
}
