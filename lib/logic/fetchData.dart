import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:joyn/constants.dart';
import 'package:joyn/logic/post_brain.dart';

class FetchLogic {
  String url = "http://damp-temple-22841.herokuapp.com/";
  PostBrain postBrain;
  String query = "";

  Future<List<PostBrain>> getPosts() async {
    query = "";
    for (int i = 0; i < kTagValues.length; i++) {
      String name =
          i != kTagValues.length - 1 ? "t" + (i + 1).toString() : "ad";
      query += "$name=" + kTagValues[i].toString() + "&";
    }
    print(query);

    List<PostBrain> list = [];

    var response = await http.get(url + "posts?" + query);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (Map x in jsonResponse) {
        var i = PostBrain.fromJson(x);
        i.proonLink();
        list.add(i);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return list;
  }
}
