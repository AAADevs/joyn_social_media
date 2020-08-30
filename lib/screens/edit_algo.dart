import 'package:flutter/material.dart';
import 'package:joyn/constants.dart';

class EditAlgo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPink,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                "assets/space_shiba.png",
                width: size.width * 0.5,
              ),
            ),
            SizedBox(
              height: kPostPadding * 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4 * kPostPadding),
              child: Text(
                "Custom Algorithms change what posts you see in your feed.",
                textAlign: TextAlign.center,
                style: kNameStyle.copyWith(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
