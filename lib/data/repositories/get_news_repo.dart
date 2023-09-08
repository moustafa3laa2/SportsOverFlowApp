import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports_app_green_eagles/data/models/get_news_model.dart';

class GetNewsRepo {
  Future<GetNewsModel?> getNews() async {
    try {
      var response = await http.get(
        Uri.parse(
            "https://newsapi.org/v2/everything?q=soccer&from=2023-08-25&sortBy=publishedAt&apiKey=7c07f0c86d484b30a5af1289c531cff1"),
      );

      var decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        GetNewsModel myResponse = GetNewsModel.fromJson(decodedResponse);

        return myResponse;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}