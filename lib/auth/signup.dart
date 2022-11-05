import 'package:flutter/material.dart';
import 'package:one_letter/auth/signin.dart';
import 'package:one_letter/widgets/mobilelayout.dart';
import 'package:one_letter/widgets/textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/undraw_city_life_gnpr 1.png',
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Image.asset(
                      "assets/Back - Solid.png",
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 25),
              child: Text(
                "Create your account ",
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
                icon: Icon(Icons.person),
                hintText: 'Full Name',
                textInputType: TextInputType.emailAddress,
                controller: emailController,
              ),
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => MobileScreenLayout()));
                },
                child: Text(
                  "Create Account",
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => Login_Screen()));
                    },
                    child: Text(
                      "Already Have an Account",
                      style: TextStyle(
                        color: Color(0xff8BC83F),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
