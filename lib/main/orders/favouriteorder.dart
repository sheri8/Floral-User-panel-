import 'package:floral/main/description/productdescription.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyFavourite extends StatelessWidget {
  const MyFavourite({Key? key}) : super(key: key);

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
          'Favourite Orders',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black),
        ),
       
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => ProductDescription()));
                },
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color(0xffFFFAEB),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Image.asset('assets/logo.png'),
                  ),
                  title: Text(
                    'Quinoa fruit salad',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    '2packs',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  trailing: Icon(Icons.favorite,color: Colors.red,)
                ),
              )),
    );
  }
}
