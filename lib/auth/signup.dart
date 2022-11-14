import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_letter/auth/signin.dart';
import 'package:one_letter/database/auth_data.dart';
import 'package:one_letter/widgets/mobilelayout.dart';
import 'package:one_letter/widgets/textfield.dart';
import 'package:one_letter/widgets/utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //Looding Variable
  bool _isLoading = false;
  Uint8List? _image;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              height: 10,
            ),
            Center(
              child: Stack(
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
                controller: fullNameController,
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
                onPressed: signUpUser,
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text(
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
  ////Functions///////

  /// Select Image From Gallery
  selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _image = ui;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String rse = await AuthMethods().signUpUser(
        email: emailController.text,
        pass: passController.text,
        username: fullNameController.text,
        file: _image!);

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse != 'sucess') {
      showSnakBar(rse, context);
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (builder) => MobileScreenLayout()));
    }
  }
}
