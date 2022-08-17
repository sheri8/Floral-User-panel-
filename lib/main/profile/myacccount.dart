import 'package:floral/main/orders/favouriteorder.dart';
import 'package:floral/main/orders/myorder.dart';
import 'package:floral/main/profile/profileedit.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

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
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            )),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text('My Profile',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 34)),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Card(
                  // shadowColor: bg,
                  // elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                         backgroundImage: AssetImage('assets/logo.png')),
                        SizedBox(height: 10),
                        Text('Rosina Doe',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 18)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Fawad Kaleem',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
            
             ListTile(
              onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (builder) => MyOrders()));

              },
              title: Text("My Orders"),
              subtitle: Text('Order Status'),
              trailing: Icon(Icons.arrow_forward_ios),
             ),
             Divider(),
              SizedBox(height: 20),
                ListTile(
              onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (builder) => MyFavourite()));

              },
              title: Text("My Favourites"),
              subtitle: Text('Favourite Orders'),
              trailing: Icon(Icons.arrow_forward_ios),
             ),
                          Divider(),
                            SizedBox(height: 20),
                ListTile(
              onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (builder) => MyProfileEdit()));

              },
              title: Text("Profile"),
              subtitle: Text('Update Profile'),
              trailing: Icon(Icons.arrow_forward_ios),
             ),
                   

              SizedBox(height: 50),
              Container(
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                margin: EdgeInsets.only(top: 60, bottom: 20),
                child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (builder) =>
                      //             MobileScreenLayout()));
                    },
                    child: Text(
                      'SAVE',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      primary: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
