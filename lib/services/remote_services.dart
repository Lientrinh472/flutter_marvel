import 'package:marvel_table/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class RemoteServices {
  Future<Data?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://gateway.marvel.com/v1/public/characters?ts=1&apikey=6d9ae6e84b80be5d3f8aea335f8e0553&hash=04eccf8262a254d136c3558d1a1436dc');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      log(json);
      var obj = marvelFromJson(json);
      return obj.data;
      // return marvelFromJson(json);
    }
    return null;
  }
}
