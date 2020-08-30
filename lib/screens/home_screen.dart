import 'package:flutter/material.dart';
import 'package:joyn/components/drawer.dart';
import 'package:joyn/components/post.dart';
import 'package:joyn/constants.dart';
import 'package:joyn/logic/fetchData.dart';
import 'package:joyn/logic/post_brain.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostBrain> list = [];
  FetchLogic fetchLogic = FetchLogic();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void update() {
    fetchLogic.getPosts().then((value) {
      setState(() {
        list = value;
        _refreshController.refreshCompleted();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kScaffoldBG,
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Builder(
                        builder: (context) => GestureDetector(
                          child: Image.asset(
                            "assets/filter.png",
                            scale: kIconScale,
                          ),
                          onTap: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),
                      Image.asset(
                        "assets/joyn_berry.png",
                        height: size.height * 0.04,
                      ),
                      Image.asset(
                        "assets/token.png",
                        height: size.height * 0.04,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child: Container(
                width: double.infinity,
                color: kFeedBG,
                child: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: false,
                  header: WaterDropHeader(),
                  footer: CustomFooter(
                    builder: (BuildContext context, LoadStatus mode) {
                      Widget body;
                      if (mode == LoadStatus.idle) {
                        body = Text("pull up load");
                      } else if (mode == LoadStatus.loading) {
                        body = Center(child: CircularProgressIndicator());
                      } else if (mode == LoadStatus.failed) {
                        body = Text("Load Failed!Click retry!");
                      } else if (mode == LoadStatus.canLoading) {
                        body = Text("release to load more");
                      } else {
                        body = Text("No more Data");
                      }
                      return Container(
                        height: 55.0,
                        child: Center(child: body),
                      );
                    },
                  ),
                  controller: _refreshController,
                  onRefresh: update,
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        int flag = 0;
                        if (kSelectedType == "All") flag = 1;
                        if (list[index].type == kSelectedType) flag = 1;
                        return flag == 1 ? Post(list[index]) : null;
                      }),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          "assets/privacy.png",
                          scale: kIconScale * 0.9,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          "assets/search.png",
                          scale: kIconScale * 0.9,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Image.asset("assets/donut_white.png"),
                      ),
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          "assets/heart_berry.png",
                          scale: kIconScale * 0.9,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          "assets/user.png",
                          scale: kIconScale * 0.9,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    update();
    super.initState();
  }
}
