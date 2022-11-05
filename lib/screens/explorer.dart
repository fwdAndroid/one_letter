import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            height: 200,
            width: 213,
            child: Stack(
              children: [
                Container(
                  child: Image.asset(
                    "assets/o.png",
                    fit: BoxFit.fill,
                    width: 213,
                    height: 200,
                  ),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.mic,
                      color: Colors.white,
                    ))
              ],
            ),
          );
        });
  }
}
