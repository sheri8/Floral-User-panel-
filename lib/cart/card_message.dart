import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../resources/firestore_methods.dart';

class CardMessage extends StatefulWidget {
  const CardMessage({Key? key}) : super(key: key);

  @override
  State<CardMessage> createState() => _CardMessageState();
}

class _CardMessageState extends State<CardMessage> {
  TextEditingController cart_message = TextEditingController();
  TextEditingController feeling = TextEditingController();
  bool loading = false;
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Card Message',
                      style: TextStyle(fontSize: 22),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.cancel, color: Colors.black))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: cart_message,
                  minLines: 2,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: 'Enter A Message Here',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Share your feeling',
                      style: TextStyle(fontSize: 22),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.share, color: Colors.black))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: feeling,
                  minLines: 2,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: 'Enter A Message Here',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.all(9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: StadiumBorder(),
                          fixedSize: Size(100, 50)),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        String result = await FirestoreMethods().cart_message(
                            cart_message: cart_message.text,
                            feeling: feeling.text);
                        if (result == 'success') {
                          debugPrint(result);
                          Navigator.pop(context);
                          setState(() {
                            loading = false;
                          });
                        } else {
                          setState(() {
                            loading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(result),
                            duration: Duration(seconds: 10),
                          ));
                        }
                      },
                      child: loading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text('Confrim'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: StadiumBorder(),
                          fixedSize: Size(100, 50)),
                    )
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
