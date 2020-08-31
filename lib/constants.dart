import 'package:flutter/material.dart';

// Tag Related
Map kTags = {
  "News and Politics": Color(0xFFFF8C00),
  "Celebrity and Influencer": Color(0xFFFFDE5C),
  "Activism and Social Causes": Color(0xFF9FF07A),
  "Arts and Entertainment": Color(0xFF67E9FF),
  "Local Businesses and Places": Color(0xFFFFC5ED),
  "Products and Companies": Color(0xFFDC9AFE),
};
final kTagNames = [
  "News and Politics",
  "Celebrity and Influencer",
  "Activism and Social Causes",
  "Arts and Entertainment",
  "Local Businesses and Places",
  "Products and Companies",
];
List<double> kTagValues = [100, 100, 100, 100, 100, 100, 100];

// Feed Related

// UI Colors
Color kScaffoldBG = Colors.white;
Color kBlue = Color(0xFF01DBFF);
Color kFeedBG = Color(0xFFf4f4f4);
Color kFeedText = Color(0xFF6B174E);
Color kPink = Color(0xFFFFC6C8);

// Text Styles
TextStyle kDefault = TextStyle(
  fontFamily: 'SFProDisplay',
  color: Colors.white,
  fontSize: 18,
);

TextStyle kNameStyle = TextStyle(
  fontFamily: 'SFProDisplay',
  color: kFeedText,
  fontSize: 19,
  fontWeight: FontWeight.w600,
);

TextStyle kPostTextStyle = TextStyle(
  fontFamily: 'SFProDisplay',
  color: kFeedText,
  fontSize: 18,
  height: 1.2,
);

TextStyle kNumStyle = TextStyle(
  fontFamily: 'SFProDisplay',
  color: kFeedText,
  fontSize: 16,
);

TextStyle kTagStyle = TextStyle(
  fontFamily: 'SFProDisplay',
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

// Constants
const double kPostPadding = 10;
const double kIconScale = 4;
String kSelectedType = "All";
