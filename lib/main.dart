import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: Home(),
      ),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String s = ' 0 pts.';

  Future<http.Response> fetchdata() async {
    http.Response response = await http.get(
        'https://competitive-coding-api.herokuapp.com/api/codechef/curiousyuvi');
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage('images/codeforces_logo.png'),
                      height: 100.0,
                      width: 100.0,
                    ),
                  ),
                ),
                new Container(
                  height: 40.0,
                  color: Colors.transparent,
                  child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.green,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(30.0),
                              topRight: const Radius.circular(30.0),
                              bottomLeft: const Radius.circular(30.0),
                              bottomRight: const Radius.circular(30.0))),
                      child: new Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "Rating: ",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ),
                      )),
                ),
                Text(
                  ' 0 pts.',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onTap: () async {
                        http.Response response = await fetchdata();
                        if (response.statusCode == 200) {

                          int rating=jsonDecode(response.body)['rating'];
                          s='$rating pts.';

                          setState(() {});
                        } else {
                          s = 'ERROR';
                          print('ERROR');
                          setState(() {});
                        }
                      },
                      child: Image(
                        image: AssetImage('images/codechef_logo.png'),
                        height: 100.0,
                        width: 100.0,
                      ),
                    ),
                  ),
                ),
                new Container(
                  height: 40.0,
                  color: Colors.transparent,
                  child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.green,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(30.0),
                              topRight: const Radius.circular(30.0),
                              bottomLeft: const Radius.circular(30.0),
                              bottomRight: const Radius.circular(30.0))),
                      child: new Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "Rating: ",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ),
                      )),
                ),
                Text(
                  s,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage('images/hackerrank_logo.png'),
                      height: 100.0,
                      width: 100.0,
                    ),
                  ),
                ),
                new Container(
                  height: 40.0,
                  color: Colors.transparent,
                  child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.green,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(30.0),
                              topRight: const Radius.circular(30.0),
                              bottomLeft: const Radius.circular(30.0),
                              bottomRight: const Radius.circular(30.0))),
                      child: new Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "Rating: ",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ),
                      )),
                ),
                Text(
                  ' 0 pts.',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
