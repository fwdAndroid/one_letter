import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_letter/resources/auth_merhods.dart';
import 'package:one_letter/responsive/mobile_screen_layout.dart';
import 'package:one_letter/responsive/responsive_layout_screen.dart';
import 'package:one_letter/responsive/web_screen_layout.dart';
import 'package:one_letter/screens/login_screen.dart';
import 'package:one_letter/utils/colors.dart';
import 'package:one_letter/utils/utils.dart';
import 'package:one_letter/widgets/text_form_field.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/letters1 1.png",
                width: 100,
              ),
              SvgPicture.asset(
                'assets/undraw_city_life_gnpr.png',
                color: primaryColor,
                height: 23,
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 59, backgroundImage: MemoryImage(_image!))
                      : CircleAvatar(
                          radius: 59,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStHaP98t10PhHsApQwJiDsh7xski6jXpQ9iEgu5bc03VGO4z-4r-xa-JwPdGmwAIf9ALM&usqp=CAU'),
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
                onTap: signUpUsers,
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        height: 60,
                        child: Text('Register'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Already an account ?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 9),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => LoginScreen()));
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

  ////Functions///////

  /// Select Image From Gallery
  selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _image = ui;
    });
  }

  ///Register Users
  signUpUsers() async {
    setState(() {
      _isLoading = true;
    });
    String rse = await AuthMethods().signUpUser(
        email: emailController.text,
        pass: passController.text,
        bio: bioController.text,
        username: userNameController.text,
        file: _image!);

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse != 'sucess') {
      showSnakBar(rse, context);
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (builder) => ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout())));
    }
  }
}
