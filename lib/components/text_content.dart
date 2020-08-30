import 'package:flutter/material.dart';

import '../constants.dart';

class TextContent extends StatelessWidget {
  final String text;

  TextContent(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20, bottom: kPostPadding),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: kPostTextStyle,
        ),
      ),
    );
  }
}
