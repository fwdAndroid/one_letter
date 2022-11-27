import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_letter/resources/auth_merhods.dart';
import 'package:one_letter/responsive/mobile_screen_layout.dart';
import 'package:one_letter/responsive/responsive_layout_screen.dart';
import 'package:one_letter/responsive/web_screen_layout.dart';
import 'package:one_letter/screens/home_screen.dart';
import 'package:one_letter/screens/signup_screen.dart';
import 'package:one_letter/utils/colors.dart';
import 'package:one_letter/utils/utils.dart';
import 'package:one_letter/widgets/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/letters1 1.png",
              width: 200,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Image.asset(
              'assets/undraw_city_life_gnpr 1.png',
              height: 65,
            ),
            SizedBox(
              height: 63,
            ),
            TextFormInputField(
              hintText: 'Enter youe email',
              textInputType: TextInputType.emailAddress,
              controller: emailController,
            ),
            SizedBox(
              height: 23,
            ),
            TextFormInputField(
              hintText: 'Enter youe password',
              textInputType: TextInputType.visiblePassword,
              controller: passController,
              isPass: true,
            ),
            SizedBox(
              height: 23,
            ),
            InkWell(
              onTap: loginUser,
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      height: 60,
                      child: Text('Login'),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      decoration: ShapeDecoration(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)))),
                    ),
            ),
            SizedBox(
              height: 13,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Don't have an account ?",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 9),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => SignUp()));
                  },
                  child: Container(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 9),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String rse = await AuthMethods().loginUpUser(
      email: emailController.text,
      pass: passController.text,
    );

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse == 'sucess') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (builder) => ResponsiveLayout(
                    mobileScreenLayout: MobileScreenLayout(),
                    webScreenLayout: WebScreenLayout(),
                  )));
    } else {
      showSnakBar(rse, context);
    }
  }
}
