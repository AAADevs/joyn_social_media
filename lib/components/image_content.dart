import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageContent extends StatelessWidget {
  final String url;

  ImageContent(this.url);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) => Image.asset("assets/loading.png"),
      errorWidget: (context, url, error) => Image.asset("assets/error.png"),
    );
  }
}
