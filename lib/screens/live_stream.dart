import 'package:flutter/material.dart';

class Live_Stream extends StatefulWidget {
  Live_Stream({Key? key}) : super(key: key);

  @override
  State<Live_Stream> createState() => _Live_StreamState();
}

class _Live_StreamState extends State<Live_Stream> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController _searchController = TextEditingController();
    String search;

    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: ListView.builder(
          // itemCount: 10,
          itemCount: 10,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.asset("assets/re.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 67,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(.2),
                    ),
                    child: ListTile(
                      leading: Image.asset("assets/Oval.png"),
                      title: TextField(
                        decoration: InputDecoration(hintText: "Enter Comment"),
                      ),
                      trailing: Text(
                        "133 Comments",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
