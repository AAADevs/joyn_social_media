import 'package:flutter/material.dart';
import 'package:joyn/constants.dart';

class DrawerListItem extends StatelessWidget {
  final String text, asset;
  final onPressed;

  DrawerListItem({this.text, this.asset, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2 * kPostPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              asset,
              width: size.width * 0.06,
            ),
            SizedBox(
              width: kPostPadding,
            ),
            Text(
              text,
              style: kNameStyle.copyWith(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
