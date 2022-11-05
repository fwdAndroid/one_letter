import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HotCommunites extends StatefulWidget {
  const HotCommunites({super.key});

  @override
  State<HotCommunites> createState() => _HotCommunitesState();
}

class _HotCommunitesState extends State<HotCommunites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hot Communities",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Text(
                  "More",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Image.asset("assets/download 4.png"),
            title: Text(
              "HOUSE OF RTM  (IMO PAKISTA..",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "We wellcome all of you esteemed m...",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            trailing: TextButton(onPressed: () {}, child: Text("Join")),
          ),
          ListTile(
            leading: Image.asset("assets/download 4.png"),
            title: Text(
              "HOUSE OF RTM  (IMO PAKISTA..",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "We wellcome all of you esteemed m...",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            trailing: TextButton(onPressed: () {}, child: Text("Join")),
          ),
          Container(
            height: 380,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    height: 200,
                    width: 213,
                    child: Container(
                      child: Image.asset(
                        "assets/o.png",
                        fit: BoxFit.fill,
                        width: 213,
                        height: 200,
                      ),
                    ),
                  );
                }),
          )
          // Image.asset("assets/iisues - Copy.png")
        ],
      ),
    );
  }
}
