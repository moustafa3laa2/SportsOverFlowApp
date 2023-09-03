import 'dart:convert';

import 'package:sports_app_green_eagles/data/models/get_countries_model.dart';
import 'package:http/http.dart' as http;

class GetCountriesRepo {
  Future<GetCountriesModel?> getCountries() async {
    var response = await http.get(Uri.parse(
        "https://apiv2.allsportsapi.com/football/?met=Countries&APIkey=dd67c8d2ca62e257ba8798d876de95ae2349758ac400cc7b02b4a55c6155291a"));
    var decodedResponse = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        var myResponse = GetCountriesModel.fromJson(decodedResponse);
        return myResponse;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
