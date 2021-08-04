import 'package:codersstatus/components/atcoderDialog.dart';
import 'package:codersstatus/components/codechefDialog.dart';
import 'package:codersstatus/components/codeforcesDialog.dart';
import 'package:codersstatus/components/myCircleAvatar.dart';
import 'package:codersstatus/components/myDividerWithTitle.dart';
import 'package:codersstatus/components/spojDialog.dart';
import 'package:codersstatus/components/urls.dart';
import 'package:codersstatus/firebase_layer/getUserInfo.dart';
import 'package:codersstatus/functions/getRating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:codersstatus/components/colorscheme.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:codersstatus/components/myTile.dart';
import 'package:rect_getter/rect_getter.dart';

class MyDashboardScreen extends StatefulWidget {
  @override
  _MyDashboardScreenState createState() => _MyDashboardScreenState();
}

class _MyDashboardScreenState extends State<MyDashboardScreen> {
  var globalKey1 = RectGetter.createGlobalKey();
  var globalKey2 = RectGetter.createGlobalKey();
  var globalKey3 = RectGetter.createGlobalKey();
  var globalKey4 = RectGetter.createGlobalKey();
  String name = 'name',
      codername = 'codername',
      avatarurl = Urls.avatar1url,
      bio = 'Hey there, I love Competitive Programming';
  List<String> userhandles = ['0', '0', '0', '0'],
      userrating = ['0', '0', '0', '0'];

  bool isFirstTime = true;

  readyUserData() async {
    final userDocument = await GetUserInfo.getUserDocument();
    print('reached -1');
    avatarurl = userDocument['avatarurl'];
    name = userDocument['name'];
    codername = userDocument['codername'];
    bio = userDocument['bio'];
    userhandles[0] = userDocument['codeforces'];
    userhandles[1] = userDocument['codechef'];
    userhandles[2] = userDocument['atcoder'];
    userhandles[3] = userDocument['spoj'];
    print('reached 0');
    userrating[0] = await GetRating.getCodeforcesRating(userhandles[0]);
    print('reached 1');
    userrating[1] = await GetRating.getCodechefRating(userhandles[1]);
    print('reached 2');
    userrating[2] = await GetRating.getAtcoderRating(userhandles[2]);
    print('reached 3');
    userrating[3] = await GetRating.getSpojRating(userhandles[3]);
    print('reached 4');
    setState(() {
      isFirstTime = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.015),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.07,
                child: Center(
                  child: Image(image: AssetImage('images/appiconnoback.png')),
                ),
              ),
              isFirstTime
                  ? FutureBuilder(
                      future: readyUserData(),
                      builder: (context, snapshot) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.22,
                              width: MediaQuery.of(context).size.height * 0.22,
                              child: MyCircleAvatar(
                                  Image(image: NetworkImage(avatarurl)))),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Text(
                            name,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'young',
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.035),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.007,
                          ),
                          Text(
                            '@' + codername,
                            style: TextStyle(
                                color: ColorSchemeClass.lightgrey,
                                fontFamily: 'young',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          MyMidDividerWithTitle('Bio'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Text(
                            bio,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorSchemeClass.lightgrey,
                                fontFamily: 'young',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          MyMidDividerWithTitle('Ratings'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Wrap(
                            children: [
                              userrating[0] != '0'
                                  ? RectGetter(
                                      key: globalKey1,
                                      child: GestureDetector(
                                        onTap: () {
                                          var rect = RectGetter.getRectFromKey(
                                              globalKey1);
                                          print(rect.toString());
                                          showCodeforcesDialog(
                                              this.context,
                                              rect,
                                              userhandles[0],
                                              userrating[0]);
                                        },
                                        child: MyTile(
                                            AssetImage(
                                                'images/codeforcestile.png'),
                                            ColorSchemeClass.codeforcespurple,
                                            userrating[0] + ' pts'),
                                      ),
                                    )
                                  : SizedBox(),
                              userrating[1] != '0'
                                  ? RectGetter(
                                      key: globalKey2,
                                      child: GestureDetector(
                                        onTap: () {
                                          var rect = RectGetter.getRectFromKey(
                                              globalKey2);
                                          print(rect.toString());
                                          showCodechefDialog(this.context, rect,
                                              userhandles[1], userrating[1]);
                                        },
                                        child: MyTile(
                                            AssetImage(
                                                'images/codecheftile.png'),
                                            ColorSchemeClass.codechefbrown,
                                            userrating[1] + ' pts'),
                                      ),
                                    )
                                  : SizedBox(),
                              userrating[2] != '0'
                                  ? RectGetter(
                                      key: globalKey3,
                                      child: GestureDetector(
                                        onTap: () {
                                          var rect = RectGetter.getRectFromKey(
                                              globalKey3);
                                          print(rect.toString());
                                          showAtcoderDialog(this.context, rect,
                                              userhandles[2], userrating[2]);
                                        },
                                        child: MyTile(
                                            AssetImage(
                                                'images/atcodertile.png'),
                                            ColorSchemeClass.atcodergrey,
                                            userrating[2] + ' pts'),
                                      ),
                                    )
                                  : SizedBox(),
                              userrating[3] != '0'
                                  ? RectGetter(
                                      key: globalKey4,
                                      child: GestureDetector(
                                        onTap: () {
                                          var rect = RectGetter.getRectFromKey(
                                              globalKey4);
                                          print(rect.toString());
                                          showSpojDialog(this.context, rect,
                                              userhandles[3], userrating[3]);
                                        },
                                        child: MyTile(
                                            AssetImage('images/spojtile.png'),
                                            ColorSchemeClass.spojblue,
                                            userrating[3] + ' pts'),
                                      ),
                                    )
                                  : SizedBox(),
                              /*myTile(AssetImage('images/githubtile.png'),
                                    Colors.white, '26 reps')*/
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
