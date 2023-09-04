import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports_app_green_eagles/data/models/get_teams.dart';
class GetTeamsRepo {
  Future<GetTeamsModel?> getTeams(leagueId) async {
    try {
      var response = await http.get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?&met=Teams&APIkey=425993696093602702f69a72803df945798494ea12369a5078abbbe050f8e34b&leagueId=$leagueId"));
      var decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        GetTeamsModel myResponse = GetTeamsModel.fromJson(decodedResponse);
        return myResponse;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}