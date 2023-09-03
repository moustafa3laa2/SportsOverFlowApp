import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports_app_green_eagles/data/models/get_leagues_model.dart';

class GetLeaguesRepo {
  Future<GetLeaguesModel?> getLeagues(countryKey) async {
    var response = await http.get(Uri.parse(
        "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=dd67c8d2ca62e257ba8798d876de95ae2349758ac400cc7b02b4a55c6155291a&countryId=$countryKey"));
    var decodedResponse = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        var myResponse = GetLeaguesModel.fromJson(decodedResponse);
        return myResponse;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
