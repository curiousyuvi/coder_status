import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetRatingFromAPI {
  static Future<String> getCodeforcesRating(String userhandle) async {
    if (userhandle == '') return '0';
    print(userhandle);
    final response = await http.Client().get(Uri.parse(
        'https://competitive-coding-api.herokuapp.com/api/codeforces/$userhandle'));
    if (response.statusCode == 200) {
      print('OK');
      try {
        //parse json
        var rating = jsonDecode(response.body)['rating'].toString().trim();
        return rating;
      } catch (e) {
        return '0';
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return '0';
    }
  }

  static Future<String> getCodechefRating(String userhandle) async {
    if (userhandle == '') return '0';
    print(userhandle);
    final response = await http.Client().get(Uri.parse(
        'https://competitive-coding-api.herokuapp.com/api/codechef/$userhandle'));
    if (response.statusCode == 200) {
      print('OK');
      try {
        //parse json
        var rating = jsonDecode(response.body)['rating'].toString().trim();
        return rating;
      } catch (e) {
        return '0';
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return '0';
    }
  }

  static Future<String> getAtcoderRating(String userhandle) async {
    if (userhandle == '') return '0';
    print(userhandle);
    final response = await http.Client().get(Uri.parse(
        'https://competitive-coding-api.herokuapp.com/api/atcoder/$userhandle'));
    if (response.statusCode == 200) {
      print('OK');
      try {
        //parse json
        var rating = jsonDecode(response.body)['rating'].toString().trim();
        return rating;
      } catch (e) {
        return '0';
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return '0';
    }
  }

  static Future<String> getSpojRating(String userhandle) async {
    if (userhandle == '') return '0';
    print(userhandle);
    final response = await http.Client().get(Uri.parse(
        'https://competitive-coding-api.herokuapp.com/api/spoj/$userhandle'));
    if (response.statusCode == 200) {
      print('OK');
      try {
        //parse json
        var rating = jsonDecode(response.body)['points'].toString().trim();
        return rating;
      } catch (e) {
        return '0';
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return '0';
    }
  }
}
