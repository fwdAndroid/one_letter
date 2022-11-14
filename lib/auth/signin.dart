import 'package:flutter/material.dart';
import 'package:one_letter/auth/signup.dart';
import 'package:one_letter/database/auth_data.dart';
import 'package:one_letter/widgets/mobilelayout.dart';
import 'package:one_letter/widgets/textfield.dart';
import 'package:one_letter/widgets/utils.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      emailController.clear();
      passController.clear();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/undraw_city_life_gnpr 1.png',
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 25),
              child: Text(
                "Let’s Sign In",
                style: TextStyle(
                    color: Color(0xff1F4C6B),
                    fontWeight: FontWeight.w800,
                    fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 15),
              child: Text(
                "quis nostrud exercitation ullamco laboris nisi ut",
                style: TextStyle(
                    color: Color(0xff53587A),
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
            ),
            SizedBox(
              height: 23,
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextFormInputField(
                icon: Icon(Icons.email),
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
                controller: emailController,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextFormInputField(
                icon: Icon(Icons.lock),
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword,
                controller: passController,
                isPass: true,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: loginUser,
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff8BC83F),
                    fixedSize: Size(268, 40)),
              ),
            ),
            Spacer(),
            Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => SignUp()));
                    },
                    child: Text(
                      "Register Your Account",
                      style: TextStyle(
                        color: Color(0xff8BC83F),
                      ),
                    )))
          ],
        ),
      ),
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
      Navigator.push(context,
          MaterialPageRoute(builder: (builder) => MobileScreenLayout()));
    } else {
      showSnakBar(rse, context);
    }
  }
}
