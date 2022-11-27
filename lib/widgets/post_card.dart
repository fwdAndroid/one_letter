import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:one_letter/models/post_model.dart';
import 'package:one_letter/models/user_model.dart';
import 'package:one_letter/provider/user_provider.dart';
import 'package:one_letter/resources/firestore_methods.dart';
import 'package:one_letter/screens/comment_screen.dart';
import 'package:one_letter/utils/colors.dart';
import 'package:one_letter/widgets/like_animations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PostCard extends StatefulWidget {
  final snap;
  PostCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLIkeAnimating = false;
  int commentLength = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getComments();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel userModel = Provider.of<UserProvider>(context).getUser;
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                  .copyWith(right: 0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 19,
                    backgroundImage: NetworkImage(widget.snap['profileImage']),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 9),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.snap['username'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (cont) => Dialog(
                                child: ListView(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  shrinkWrap: true,
                                  children: ['Delete']
                                      .map((e) => InkWell(
                                          onTap: () async{
                                            await FirestoreMethods().deletePost(widget.snap['postId']);
                                         },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 16),
                                            child: Text(e),
                                          )))
                                      .toList(),
                                ),
                              ));
                    },
                    icon: Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
            // Image Selection And Like Animation
            GestureDetector(
              //Like Counter When double tap the image
              onDoubleTap: () async {
                await FirestoreMethods().likePosts(
                    widget.snap['postId'], userModel.uid, widget.snap['likes']);
                setState(() {
                  isLIkeAnimating = true;
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.network(
                          widget.snap['postUrl'],
                        ),
                      )),
                  AnimatedOpacity(
                    opacity: isLIkeAnimating ? 1 : 0,
                    duration: Duration(milliseconds: 200),
                    child: LikeAnimation(
                      child:
                          Icon(Icons.favorite, size: 100, color: Colors.white),
                      isAnimating: isLIkeAnimating,
                      duration: Duration(milliseconds: 400),
                      onEnd: () {
                        setState(() {
                          isLIkeAnimating = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            //Like Comment Section
            Row(
              children: [
                LikeAnimation(
                  isAnimating:  widget.snap['likes'].contains(userModel.uid),
                  
                  smallLike: true,
                  child: IconButton(
                    onPressed: () async {
                      await FirestoreMethods().likePosts(widget.snap['postId'],
                          userModel.uid, widget.snap['likes']);
                    },
                    icon: widget.snap['likes'].contains(userModel.uid)?  Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ): Icon(
                      Icons.favorite,
                      color: Colors.black,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (builder) => CommentScreen(snap: widget.snap,)));
                  },
                  icon: Icon(
                    Icons.comment_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bookmark,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// Description
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle(
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontWeight: FontWeight.w800),
                      child: Text(
                        '${widget.snap['likes'].length} likes',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 9),
                      child: RichText(
                          text: TextSpan(
                        style: TextStyle(color: primaryColor),
                        children: [
                          TextSpan(
                              text: widget.snap['username'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: ' ${widget.snap['description']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black))
                        ],
                      )),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'View $commentLength Comments',
                        style: TextStyle(fontSize: 15, color: secondaryColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        DateFormat.yMMMd()
                            .format(widget.snap['datePublished'].toDate()),
                        style: TextStyle(fontSize: 15, color: secondaryColor),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }


/// Get Coments List
  Future<void> getComments() async{
    try{
         QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('posts').doc(widget.snap['postId']).collection('comments').get();
   commentLength = querySnapshot.docs.length;
    }catch(e){
      print(e.toString());
    }

  }
}
