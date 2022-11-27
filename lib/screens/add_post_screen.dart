import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_letter/models/user_model.dart';
import 'package:one_letter/provider/user_provider.dart';
import 'package:one_letter/resources/firestore_methods.dart';
import 'package:one_letter/utils/colors.dart';
import 'package:one_letter/utils/utils.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  TextEditingController descriptionController = TextEditingController();

  //Linear Indicator
  bool _isloading = false;

  //Functions
  ///Select Image Dialog///
  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (builder) {
          return SimpleDialog(
            title: Text('Create a Post'),
            children: [
              /// For Camera
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text('Take a photo From Camera'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              // For Gallery
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text('Take a photo from gallery'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text('Cancel'),
                onPressed: () async {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

//// Post Data to Firebase
  void postImageInFirebase(

      String uid, String username, String profImage) async {
    try {
      setState(() {
        _isloading = true;
      });
      String res = await FirestoreMethods().uploadPosts(
          _file!, descriptionController.text, uid, username, profImage);

      if (res == "success") {
         setState(() {
          _isloading = false;
        });
        showSnakBar('Posted', context);
        clearImage();
       
      } else {
                setState(() {
          _isloading = false;
        });
        showSnakBar(res, context);
      }
    } catch (e) {
      showSnakBar(e.toString(), context);
    }
  }

  ///Clear Image
  void clearImage(){
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel userModel = Provider.of<UserProvider>(context).getUser;
    return _file == null
        ? Center(
            child: IconButton(
                onPressed: () {
                  _selectImage(context);
                },
                icon: Icon(Icons.upload)),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading:
                  IconButton(onPressed:clearImage, icon: Icon(Icons.arrow_back)),
              title: Text("Post To"),
              centerTitle: false,
              actions: [
                TextButton(
                    onPressed: () => postImageInFirebase(userModel.uid, userModel.username, userModel.photoURL),
                    child: Text(
                      "Post",
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ))
              ],
            ),
            body: Column(
              children: [
                _isloading ?LinearProgressIndicator():Padding(
                  padding: EdgeInsets.only(top: 0),
                ),
                Divider(),
                                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(userModel.photoURL),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .55,
                      child: TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          hintText: 'Write a caption',
                          border: InputBorder.none,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: MemoryImage(_file!),
                                  fit: BoxFit.fill)),
                          alignment: FractionalOffset.topCenter,
                        ),
                      ),
                    ),
                    Divider()
                  ],
                )
              ],
            ),
          );
  }
}
