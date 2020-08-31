import 'package:flutter/material.dart';

import '../constants.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          "Create new algorithm",
          style: kNameStyle.copyWith(fontSize: 22),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 4 * kPostPadding, vertical: 2 * kPostPadding),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Which type of algorithm will you create?",
                    style: kDefault.copyWith(
                        color: kFeedText, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 5 * kPostPadding,
                ),
                Image.asset(
                  "assets/list.png",
                  width: size.width * 0.6,
                ),
                SizedBox(
                  height: kPostPadding,
                ),
                Center(
                  child: Text(
                    "List",
                    style: kDefault.copyWith(
                        color: kFeedText, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 0.7 * kPostPadding,
                ),
                Center(
                  child: Text(
                    "Only see posts from accounts that you add to the list.",
                    style: kDefault.copyWith(
                      color: kFeedText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 6 * kPostPadding,
                ),
                Image.asset(
                  "assets/composition.png",
                  width: size.width * 0.6,
                ),
                SizedBox(
                  height: kPostPadding,
                ),
                Center(
                  child: Text(
                    "Composition",
                    style: kDefault.copyWith(
                        color: kFeedText, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 0.7 * kPostPadding,
                ),
                Center(
                  child: Text(
                    "Use sliders to change which types of account you see the most posts from.",
                    style: kDefault.copyWith(
                      color: kFeedText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
