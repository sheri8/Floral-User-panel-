import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floral/main/description/productdescription.dart';
import 'package:flutter/material.dart';

class Trouser extends StatefulWidget {
  final snap2;
  const Trouser({Key? key, required this.snap2}) : super(key: key);

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
          widget.snap2['Category'],
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Order')
              .where("Category", isEqualTo: "Trouser")
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
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => ProductDescription(
                                      snap: snapshot.data!.docs[index],
                                    )));
                      },
                      leading: SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.network(
                          widget.snap2['Photo Url'],
                          // snapshot.data!.docs[index]['Photo Url'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        widget.snap2['Category'],

                        // snapshot.data!.docs[index]['Categroy'],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        widget.snap2['Name'],

                        // snapshot.data!.docs[index]['Name'],
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      trailing: Text(
                        '\$ ${widget.snap2['Price']}',
                        // '\$ ${snapshot.data!.docs[index]['Price']}',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
