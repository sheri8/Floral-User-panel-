import 'package:floral/cart/card_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: Text('Cart',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Container(
                            height: MediaQuery.of(context).size.height/2,
           width: MediaQuery.of(context).size.width,
            child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     CircleAvatar(
                          backgroundImage: AssetImage('assets/flower.png'),
                        ),
                         Text(('Four Flowers'),style: TextStyle(color: Colors.black),),
                         
                      Container(
                        child: 
                        Row(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.add_circle)),
                            SizedBox(width: 10,),
                            Text('1'),
                                                        SizedBox(width: 10,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.cancel),
                            )
                          ],
                        ),
                      )
                  ],
                )
              );

              
            }),
          ),
          Container(
            margin: EdgeInsets.all(9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                                Text('22/12/2022',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500),),

              ],
            ),
          ),

           Container(child: TextButton.icon(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder) => CardMessage()));
           }, icon: Icon(Icons.card_giftcard,color: Colors.pink,), label: Text('Card Message',style: TextStyle(color: Colors.black),),),),       
                Container(
                  margin: EdgeInsets.only(left:9),
                  child: Text('Relevant Products',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),

           Container(
                            height: 160,
           width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  child: Column(
                    children: [
                      Card(child: Image.asset('assets/download.png',height: 100,width: 100,fit: BoxFit.cover,)),
                      Text('Sparkling Image'),
                      Text('USD \$40')
                    ],
                  ),
                ),
              );

              
            }),
          ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child:  ElevatedButton(
                  onPressed: () async {
               //  Navigator.push(context, MaterialPageRoute(builder: (builder) => AddToCart()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary:  Color(0xff000000),
                               fixedSize: Size(200, 54)
                  ),
                  child:
                  Text(
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