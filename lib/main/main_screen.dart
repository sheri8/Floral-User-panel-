import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floral/main/chat/chats/screens/chat_page.dart';
import 'package:floral/main/description/productdescription.dart';
import 'package:floral/widgets/mydrawer.dart';
import 'package:flutter/material.dart';

import '../widgets/text_form_field.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xffFFE2E6),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Color(0xffFFE2E6),
        centerTitle: true,
        title: Text(
          'Floral',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (builder) => ChatPage()));
            },
            icon: Icon(
              Icons.message,
              color: Colors.black,
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextFormInputField(
                hintText: 'Search',
                textInputType: TextInputType.emailAddress,
                controller: _searchController,
              ),
            ),
            StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('Order').snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              ProductDescription(
                                                snap: snapshot.data!.docs[index]
                                                    .data(),
                                              )));
                                },
                                child: Image.network(
                                  snapshot.data!.docs[index]['Photo Url'],
                                  fit: BoxFit.cover,
                                )),
                          );
                        }),
                  );
                }),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text("Best Seller of the week")),
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text('See all'))
                ],
              ),
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Order')
                    .where("Category", isEqualTo: "Shirt")
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    height: 160,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              child: Column(
                                children: [
                                  Card(
                                      elevation: 10,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (builder) =>
                                                      ProductDescription(
                                                        snap: snapshot
                                                            .data!.docs[index]
                                                            .data(),
                                                      )));
                                        },
                                        child: Image.network(
                                          snapshot.data!.docs[index]
                                              ['Photo Url'],
                                          fit: BoxFit.cover,
                                          height: 100,
                                          width: 100,
                                        ),
                                      )),
                                  Text(snapshot.data!.docs[index]['Category']),
                                  Text(
                                      'USD \$ ${snapshot.data!.docs[index]['Price']}')
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                }),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Order')
                    .where('Category', isEqualTo: "Perfumes")
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 160,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 100,
                                        child: Column(
                                          children: [
                                            Card(
                                                elevation: 10,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (builder) =>
                                                                ProductDescription(
                                                                  snap: snapshot
                                                                      .data!
                                                                      .docs[
                                                                          index]
                                                                      .data(),
                                                                )));
                                                  },
                                                  child: Image.network(
                                                    snapshot.data!.docs[index]
                                                        ['Photo Url'],
                                                    fit: BoxFit.cover,
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                )),
                                            Text(snapshot.data!.docs[index]
                                                ['Category']),
                                            Text(
                                                'USD \$ ${snapshot.data!.docs[index]['Price']}')
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          );
                        }),
                  );
                }),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Order')
                    .where('Category', isEqualTo: "Computer")
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 160,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 100,
                                        child: Column(
                                          children: [
                                            Card(
                                                elevation: 10,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (builder) =>
                                                                ProductDescription(
                                                                  snap: snapshot
                                                                      .data!
                                                                      .docs[
                                                                          index]
                                                                      .data(),
                                                                )));
                                                  },
                                                  child: Image.network(
                                                    snapshot.data!.docs[index]
                                                        ['Photo Url'],
                                                    fit: BoxFit.cover,
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                )),
                                            Text(snapshot.data!.docs[index]
                                                ['Category']),
                                            Text(
                                                'USD \$ ${snapshot.data!.docs[index]['Price']}')
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          );
                        }),
                  );
                }),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Order')
                    .where('Category', isEqualTo: "Shoes")
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 160,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 100,
                                        child: Column(
                                          children: [
                                            Card(
                                                elevation: 10,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (builder) =>
                                                                ProductDescription(
                                                                  snap: snapshot
                                                                      .data!
                                                                      .docs[
                                                                          index]
                                                                      .data(),
                                                                )));
                                                  },
                                                  child: Image.network(
                                                    snapshot.data!.docs[index]
                                                        ['Photo Url'],
                                                    fit: BoxFit.cover,
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                )),
                                            Text(snapshot.data!.docs[index]
                                                ['Category']),
                                            Text(
                                                'USD \$ ${snapshot.data!.docs[index]['Price']}')
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          );
                        }),
                  );
                }),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Order')
                    .where('Category', isEqualTo: "Trouser")
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 160,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 100,
                                        child: Column(
                                          children: [
                                            Card(
                                                elevation: 10,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (builder) =>
                                                                ProductDescription(
                                                                  snap: snapshot
                                                                      .data!
                                                                      .docs[
                                                                          index]
                                                                      .data(),
                                                                )));
                                                  },
                                                  child: Image.network(
                                                    snapshot.data!.docs[index]
                                                        ['Photo Url'],
                                                    fit: BoxFit.cover,
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                )),
                                            Text(snapshot.data!.docs[index]
                                                ['Category']),
                                            Text(
                                                'USD \$ ${snapshot.data!.docs[index]['Price']}')
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          );
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
