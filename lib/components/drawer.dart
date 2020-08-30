import 'package:flutter/material.dart';
import 'package:joyn/components/custom_algo.dart';
import 'package:joyn/components/drawer_list_item.dart';
import 'package:joyn/constants.dart';
import 'package:joyn/screens/edit_algo.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 4 * kPostPadding,
            left: 2 * kPostPadding,
            right: 2 * kPostPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/donut_drip_pink.png",
                    width: size.width * 0.15,
                  ),
                  SizedBox(
                    width: 2 * kPostPadding,
                  ),
                  Text(
                    "My Feed Controls",
                    style: kNameStyle.copyWith(fontSize: 22),
                  ),
                ],
              ),
              SizedBox(
                height: 2 * kPostPadding,
              ),
              Text(
                "Sort By",
                style: kNameStyle.copyWith(fontSize: 22),
              ),
              SizedBox(
                height: 1.5 * kPostPadding,
              ),
              DrawerListItem(
                text: "Latest posts first",
                asset: "assets/Arrow.png",
              ),
              DrawerListItem(
                text: "Popular posts first",
                asset: "assets/Heart.png",
              ),
              SizedBox(
                height: 2 * kPostPadding,
              ),
              Text(
                "Filter By",
                style: kNameStyle.copyWith(fontSize: 22),
              ),
              SizedBox(
                height: 1.5 * kPostPadding,
              ),
              DrawerListItem(
                text: "All",
                asset: "assets/check-mark.png",
                onPressed: () {
                  kSelectedType = "All";
                  Navigator.pop(context);
                },
              ),
              DrawerListItem(
                text: "Videos",
                asset: "assets/video.png",
                onPressed: () {
                  kSelectedType = "Video";
                  Navigator.pop(context);
                },
              ),
              DrawerListItem(
                text: "Photos",
                asset: "assets/image.png",
                onPressed: () {
                  kSelectedType = "Image";
                  Navigator.pop(context);
                },
              ),
              DrawerListItem(
                text: "Text",
                asset: "assets/text.png",
                onPressed: () {
                  kSelectedType = "Text";
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: kPostPadding,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Your custom algorithms",
                    style: kNameStyle.copyWith(fontSize: 22),
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/question.png",
                    scale: kIconScale,
                  ),
                ],
              ),
              SizedBox(
                height: 2 * kPostPadding,
              ),
              AlgoItem(
                text: "Create New",
                asset: "assets/add.png",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditAlgo()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
