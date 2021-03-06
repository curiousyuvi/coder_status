import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

//***************************************************************************/
//*********************WEB SCRAPING******************************/
//***************************************************************************/
class GetRating {
  static Future<String> getCodeforcesRating(String userhandle) async {
    if (userhandle == '') return '0';
    final response = await http.Client()
        .get(Uri.parse('https://codeforces.com/profile/$userhandle'));
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      try {
        var rating = document
            .getElementsByClassName('info')[0]
            .children[1]
            .children[0]
            .children[1];
        return rating.text.trim();
      } catch (e) {
        return '0';
      }
    } else {
      return '0';
    }
  }

  static Future<String> getCodechefRating(String userhandle) async {
    if (userhandle == '') return '0';
    final response = await http.Client()
        .get(Uri.parse('https://www.codechef.com/users/$userhandle'));
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      try {
        var rating = document
            .getElementsByClassName('rating-header text-center')[0]
            .children[0];
        return rating.text.trim();
      } catch (e) {
        return '0';
      }
    } else {
      return '0';
    }
  }

  static Future<String> getAtcoderRating(String userhandle) async {
    if (userhandle == '') return '0';
    final response = await http.Client()
        .get(Uri.parse('https://atcoder.jp/users/$userhandle'));
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      try {
        var ratingElement = document
            .getElementsByClassName('col-md-9 col-sm-12')[0]
            .children[2]
            .children[0]
            .children[1]
            .children[1];
        final rating = ratingElement.text.trim();
        if (rating.contains('Provisional')) {
          return rating.substring(0, 5).trim();
        }
        return rating;
      } catch (e) {
        return '0';
      }
    } else {
      return '0';
    }
  }

  static Future<String> getSpojRating(String userhandle) async {
    if (userhandle == '') return '0';
    final response = await http.Client()
        .get(Uri.parse('https://www.spoj.com/users/$userhandle/'));
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      try {
        var rating = document.getElementsByClassName('col-md-3')[0].children[5];

        String temp = rating.text.trim();
        int s = temp.indexOf('(') + 1;
        int l = temp.length - 8;
        return temp.substring(s, l);
      } catch (e) {
        return '0';
      }
    } else {
      return '0';
    }
  }
}
