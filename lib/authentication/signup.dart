import 'dart:typed_data';

import 'package:floral/authentication/login.dart';
import 'package:floral/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../resources/auth_methods.dart';
import '../utils/utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  Uint8List? _image;

  //Looding Variable
  bool _isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.clear();
    passController.clear();
    bioController.clear();
    userNameController.clear();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await Authmethods().signUpUser(
      email: emailController.text,
      password: passController.text,
      username: userNameController.text,
      bio: bioController.text,
      file: _image!,
    );
    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Login_Screen()
            // const ResponsiveLayout(
            //   webScreenLayout: WebScreenLayout(),
            //   mobileScreenLayout: MobileScreenLayout(),
            // ),
            ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFE2E6),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 59, backgroundImage: MemoryImage(_image!))
                      : CircleAvatar(
                          radius: 59,
                          backgroundImage: NetworkImage(
                              'https://static.remove.bg/remove-bg-web/a6eefcd21dff1bbc2448264c32f7b48d7380cb17/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png'),
                        ),
                  Positioned(
                      bottom: -10,
                      left: 70,
                      child: IconButton(
                          onPressed: () => selectImage(),
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          )))
                ],
              ),
              SizedBox(
                height: 23,
              ),
              TextFormInputField(
                hintText: 'Enter your username',
                textInputType: TextInputType.text,
                controller: userNameController,
              ),
              SizedBox(
                height: 23,
              ),
              TextFormInputField(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                controller: emailController,
              ),
              SizedBox(
                height: 23,
              ),
              TextFormInputField(
                hintText: 'Enter your password',
                textInputType: TextInputType.visiblePassword,
                controller: passController,
                isPass: true,
              ),
              SizedBox(
                height: 23,
              ),
              TextFormInputField(
                hintText: 'Enter your Bio',
                textInputType: TextInputType.text,
                controller: bioController,
              ),
              SizedBox(
                height: 23,
              ),
              InkWell(
                onTap: () {
                  signUpUser();
                },
                child: Container(
                  height: 60,
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  decoration: ShapeDecoration(
                      color: Color(0xff000000),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)))),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Already an account ?",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 9),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => Login_Screen()));
                    },
                    child: Container(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 9),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  ////Functions///////

  // / Select Image From Gallery
  // selectImage() async {
  //   Uint8List ui = await pickImage(ImageSource.gallery);
  //   setState(() {
  //     _image = ui;
  //   });
  // }

  ///Register Users
  // signUpUsers() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   String rse = await AuthMethods().signUpUser(
  //       email: emailController.text,
  //       pass: passController.text,
  //       bio: bioController.text,
  //       username: userNameController.text,
  //       file: _image!);

  //   print(rse);
  //   setState(() {
  //     _isLoading = false;
  //   });
  //   if (rse != 'sucess') {
  //     showSnakBar(rse, context);
  //   } else {
  //     MaterialPageRoute(
  //         builder: (builder) => ResponsiveLayout(
  //             mobileScreenLayout: MobileScreenLayout(),
  //             webScreenLayout: WebScreenLayout()));
  //   }
  // }
}
