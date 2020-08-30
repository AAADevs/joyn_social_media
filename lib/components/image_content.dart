import 'package:flutter/material.dart';

class ImageContent extends StatelessWidget {
  final String url;

  ImageContent(this.url);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
