import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joyn/components/semi_circle.dart';
import 'package:joyn/logic/post_brain.dart';
import 'package:readmore/readmore.dart';

import '../constants.dart';
import 'circle_image.dart';
import 'heart.dart';
import 'image_content.dart';

class Post extends StatefulWidget {
  PostBrain _postBrain;

  Post(this._postBrain);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double iconWidth = size.width * 0.07, iconHeight = size.height * 0.07;

    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 20),
      child: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: kPostPadding),
                      child: Row(
                        children: [
                          CircleImage.name(
                            40,
                            40,
                            widget._postBrain.avatar,
                            Colors.white,
                          ),
                          SizedBox(
                            width: kPostPadding,
                          ),
                          Text(
                            widget._postBrain.username,
                            style: kNameStyle,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Image.asset(
                          "assets/Action.png",
                          width: iconWidth,
                        ),
                        SemiCircle(
                          diameter: iconWidth,
                          color: kTags[widget._postBrain.tag],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ImageContent(
                  widget._postBrain.imgUrl,
                ),
                widget._postBrain.type == "Video"
                    ? Image.asset(
                        "assets/play.png",
                        width: iconWidth * 3,
                      )
                    : Container()
              ],
            ),
            // Reaction Area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              liked = !liked;
                            });
                          },
                          child: Heart(liked)),
                      SizedBox(
                        width: kPostPadding,
                      ),
                      Text(
                        widget._postBrain.likes.toString(),
                        style: kNumStyle,
                      ),
                      SizedBox(
                        width: size.width * 0.1,
                      ),
                      Image.asset(
                        "assets/Comment.png",
                        width: iconWidth,
                        height: iconHeight,
                      ),
                      SizedBox(
                        width: kPostPadding,
                      ),
                      Text(
                        widget._postBrain.comments.toString(),
                        style: kNumStyle,
                      ),
                      Spacer(),
                      Image.asset(
                        "assets/Bookmark.png",
                        width: iconWidth,
                        height: iconHeight,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kPostPadding,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget._postBrain.username,
                        style: kNameStyle.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: kPostPadding,
                      ),
                      Expanded(
                        child: ReadMoreText(
                          widget._postBrain.caption,
                          style: kNumStyle,
                          trimLines: 3,
                          colorClickableText: Colors.pink,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '...show more',
                          trimExpandedText: ' show less',
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
