import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


import 'package:sports_app_green_eagles/data/models/get_player_model.dart';

class Getplayersrepo {
  final String apiKey="78d1729b6765416f7346de1b1f4ee4e06b81e3286cd1218a202b18ebe0261326";
  Getplayersrepo ();
  Future<PlayerData?> getplayer(teamId) async {
    try {
      final apiUrl =
          'https://apiv2.allsportsapi.com/football/?&met=Players&teamId=$teamId&APIkey=$apiKey';
      var response =  await http.get(Uri.parse(apiUrl));
      var decoderesponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        PlayerData myresponces = PlayerData.fromJson(decoderesponse);
        return myresponces;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}