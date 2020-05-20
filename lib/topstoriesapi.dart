import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:news_app/screens/topstorymdel.dart';

class TopStoryApi {
  String url = 'http://jsonplaceholder.typicode.com/posts';

  Future<dynamic> fetchPost() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      print(decodedData);
      return decodedData;
    }
  }
}
