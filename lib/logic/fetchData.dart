import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:joyn/logic/post_brain.dart';

class FetchLogic {
  String url = "http://damp-temple-22841.herokuapp.com/";
  PostBrain postBrain;

  Future<List<PostBrain>> getPosts() async {
    List<PostBrain> list = [];
    String query = "t1=50&t2=10&t3=0&t4=0&t5=0&t6=0&ad=0";
    var response = await http.get(url + "posts?" + query);
    print(url + "posts?" + query);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
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
