import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double width, height;
  final String url;
  final Color borderColor;

  CircleImage.name(this.width, this.height, this.url, this.borderColor);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            // Story Indication
//            border: Border.all(
//              color: borderColor,
//              width: 2,
//            ),
            image: new DecorationImage(
                fit: BoxFit.fill, image: new NetworkImage(url))));
  }
}
