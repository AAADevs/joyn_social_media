import 'package:flutter/material.dart';

class Heart extends StatelessWidget {
  bool liked = false;
  final double size = 20;

  Heart(this.liked);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double iconWidth = size.width * 0.07, iconHeight = size.height * 0.07;

    if (liked) {
      return Image.asset(
        "assets/heart_berry.png",
        width: iconWidth,
        height: iconHeight,
      );
    } else {
      return Image.asset(
        "assets/heart_berry.png",
        width: iconWidth,
        height: iconHeight,
      );
    }
  }
}
