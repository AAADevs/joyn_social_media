import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joyn/components/custom_algo.dart';
import 'package:joyn/components/slider.dart';
import 'package:joyn/constants.dart';

import 'info.dart';

class EditAlgo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPink,
        elevation: 0,
        toolbarHeight: size.height * 0.12,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/back.png",
            scale: kIconScale,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Custom Algorithms",
          style: kNameStyle.copyWith(fontSize: 22),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Arc(
                height: 2 * kPostPadding,
                child: Container(
                  padding: EdgeInsets.only(bottom: 2.5 * kPostPadding),
                  color: kPink,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          "assets/space_shiba.png",
                          width: size.width * 0.4,
                        ),
                      ),
                      SizedBox(
                        height: kPostPadding * 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4 * kPostPadding),
                        child: Text(
                          "Custom Algorithms change what posts you see in your feed.",
                          textAlign: TextAlign.center,
                          style: kNameStyle.copyWith(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My custom algorithms",
                        style: kNameStyle.copyWith(fontSize: 22),
                      ),
                      SizedBox(
                        height: 2 * kPostPadding,
                      ),
                      AlgoItem(
                        text: "Create New",
                        asset: "assets/add.png",
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Info()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Arc(
                  height: 2 * kPostPadding,
                  edge: Edge.TOP,
                  arcType: ArcType.CONVEX,
                  child: Container(
                    padding: EdgeInsets.only(top: 2 * kPostPadding),
                    width: double.infinity,
                    color: kFeedText,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/algo1.png",
                          scale: kIconScale * 0.5,
                        ),
                        SizedBox(
                          height: 1.5 * kPostPadding,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Feed Composition",
                              style: kNameStyle.copyWith(
                                  color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              width: kPostPadding,
                            ),
                            Image.asset(
                              "assets/pencil_peach.png",
                              scale: kIconScale,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.5 * kPostPadding,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: kPink),
                          ),
                          child: Text(
                            "Edit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3 * kPostPadding,
                        ),
                        // Sliders
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Column(
                            children: List.generate(kTagNames.length,
                                (index) => TagSlider(kTagNames[index], index)),
                          ),
                        ),
                        SizedBox(
                          height: 2 * kPostPadding,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
