import 'package:flutter/material.dart';
import 'package:joyn/constants.dart';

class AlgoItem extends StatelessWidget {
  final String text, asset;
  final onPressed;

  AlgoItem({this.text, this.asset, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2 * kPostPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              asset,
              width: size.width * 0.15,
            ),
            SizedBox(
              height: kPostPadding * 0.7,
            ),
            Text(
              text,
              style: kNameStyle.copyWith(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
