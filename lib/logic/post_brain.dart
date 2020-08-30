class PostBrain {
  int likes, comments;
  String username, tag, type, caption, imgUrl, avatar;
  DateTime time;
  String driveLink = "https://drive.google.com/uc?export=view&id=";

  PostBrain(
      {this.likes,
      this.comments,
      this.username,
      this.tag,
      this.type,
      this.caption,
      this.imgUrl,
      this.avatar});

  proonLink() {
    imgUrl = driveLink + (imgUrl.substring(32, imgUrl.length - 17));
    avatar = driveLink + (avatar.substring(32, avatar.length - 17));
  }

  PostBrain.fromJson(Map<String, dynamic> json)
      : likes = json['likes'],
        comments = json['comments'],
        username = json['username'],
        tag = json['tag'],
        type = json['postType'],
        caption = json['caption'],
        imgUrl = json['imageUrl'],
        avatar = json['profileUrl'];
}
