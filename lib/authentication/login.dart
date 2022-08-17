import 'package:floral/authentication/signup.dart';
import 'package:floral/main/main_screen.dart';
import 'package:floral/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

import '../resources/auth_methods.dart';
import '../utils/utils.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    bool _isLoading = false;
    @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      emailController.clear();
      passController.clear();
    }

    void loginUser() async {
      setState(() {
        _isLoading = true;
      });
      String res = await Authmethods().loginUser(
          email: emailController.text, password: passController.text);

      if (res == "success") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()
              //  const ResponsiveLayout(
              //   webScreenLayout: WebScreenLayout(),
              //   mobileScreenLayout: MobileScreenLayout(),
              // ),
              ),
        );
      } else {
        showSnackBar(res, context);
      }
      setState(() {
        _isLoading = false;
      });
    }

    return Scaffold(
      backgroundColor: Color(0xffFFE2E6),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 200,
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextFormInputField(
                hintText: 'Enter your Email',
                textInputType: TextInputType.emailAddress,
                controller: emailController,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextFormInputField(
                hintText: 'Enter your Password',
                textInputType: TextInputType.visiblePassword,
                controller: passController,
                isPass: true,
              ),
            ),
            SizedBox(
              height: 23,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () async {
                      loginUser();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff000000), fixedSize: Size(366, 54)),
                    child: _isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                  );
                }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Forgot Password'),
                    )),
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) => SignUp()));
                      },
                      child: Text('Sign Up'),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
