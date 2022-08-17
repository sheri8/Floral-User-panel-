import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardMessage extends StatefulWidget {
  const CardMessage({Key? key}) : super(key: key);

  @override
  State<CardMessage> createState() => _CardMessageState();
}

class _CardMessageState extends State<CardMessage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Card Message',style: TextStyle(fontSize: 22),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.cancel,color: Colors.black))
                  ],
                ),
              ),
     Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                // controller: _Textcontroller,
                minLines: 2,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Enter A Message Here',
                  hintStyle: TextStyle(
                    color: Colors.grey
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )
                ),
              ),
            ),
   Padding(
     padding: const EdgeInsets.all(8.0),
     child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Share your feeling',style: TextStyle(fontSize: 22),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.black))
                  ],
                ),
   ),
               Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                // controller: _Textcontroller,
                minLines: 2,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Enter A Message Here',
                  hintStyle: TextStyle(
                    color: Colors.grey
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: (){}, child: Text('Cancel')
                  ,style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                   shape: StadiumBorder(),
                   fixedSize: Size(100, 50)
                  ),),
                                  ElevatedButton(onPressed: (){}, child: Text('Confrim'),style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                   shape: StadiumBorder(),
                   fixedSize: Size(100, 50)
                  ),)

                ],
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}