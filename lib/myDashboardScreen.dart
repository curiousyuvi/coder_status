import 'package:coderstatus/components/atcoderDialog.dart';
import 'package:coderstatus/components/codechefDialog.dart';
import 'package:coderstatus/components/codeforcesDialog.dart';
import 'package:coderstatus/components/myDashboardScreenSkeleton.dart';
import 'package:coderstatus/components/myDividerWithTitle.dart';
import 'package:coderstatus/components/myRatingCard.dart';
import 'package:coderstatus/components/spojDialog.dart';
import 'package:coderstatus/components/urls.dart';
import 'package:coderstatus/firebase_layer/getUserInfo.dart';
import 'package:coderstatus/functions/getRating.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coderstatus/components/colorscheme.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:rive/rive.dart';

import 'components/myCircleAvatar.dart';

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
  List<String> userhandles = ['', '', '', ''],
      userrating = ['0', '0', '0', '0'];

  bool isFirstTimeUserData = true;
  bool isFirstTimeUserRatings = true;
  List<Widget> listOfRatingCards = [];

  readyUserData() async {
    final userDocument = await GetUserInfo.getUserDocument();
    avatarurl = userDocument['avatarurl'];
    name = userDocument['name'];
    codername = userDocument['codername'];
    bio = userDocument['bio'];

    setState(() {
      isFirstTimeUserData = false;
    });
  }

  readyUserRatings() async {
    final userDocument = await GetUserInfo.getUserDocument();

    userhandles[0] = userDocument['codeforces'];
    userhandles[1] = userDocument['codechef'];
    userhandles[2] = userDocument['atcoder'];
    userhandles[3] = userDocument['spoj'];

    if (userhandles[0] != '') {
      userrating[0] = await GetRating.getCodeforcesRating(userhandles[0]);
      if (userrating[0] != '0')
        listOfRatingCards.add(RectGetter(
          key: globalKey1,
          child: GestureDetector(
            onTap: () {
              var rect = RectGetter.getRectFromKey(globalKey1);
              showCodeforcesDialog(
                  this.context, rect, userhandles[0], userrating[0]);
            },
            child: MyRatingCard(AssetImage('images/codeforcestile.png'),
                ColorSchemeClass.codeforcespurple, userrating[0] + ' pts'),
          ),
        ));
    }

    if (userhandles[1] != '') {
      userrating[1] = await GetRating.getCodechefRating(userhandles[1]);
      if (userrating[1] != '0')
        listOfRatingCards.add(RectGetter(
          key: globalKey2,
          child: GestureDetector(
            onTap: () {
              var rect = RectGetter.getRectFromKey(globalKey2);
              showCodechefDialog(
                  this.context, rect, userhandles[1], userrating[1]);
            },
            child: MyRatingCard(AssetImage('images/codecheftile.png'),
                ColorSchemeClass.codechefbrown, userrating[1] + ' pts'),
          ),
        ));
    }

    if (userhandles[2] != '') {
      userrating[2] = await GetRating.getAtcoderRating(userhandles[2]);
      if (userrating[2] != '0')
        listOfRatingCards.add(RectGetter(
          key: globalKey3,
          child: GestureDetector(
            onTap: () {
              var rect = RectGetter.getRectFromKey(globalKey3);
              showAtcoderDialog(
                  this.context, rect, userhandles[2], userrating[2]);
            },
            child: MyRatingCard(AssetImage('images/atcodertile.png'),
                ColorSchemeClass.atcodergrey, userrating[2] + ' pts'),
          ),
        ));
    }

    if (userhandles[3] != '') {
      userrating[3] = await GetRating.getSpojRating(userhandles[3]);
      if (userrating[3] != '0')
        listOfRatingCards.add(RectGetter(
          key: globalKey4,
          child: GestureDetector(
            onTap: () {
              var rect = RectGetter.getRectFromKey(globalKey4);
              showSpojDialog(this.context, rect, userhandles[3], userrating[3]);
            },
            child: MyRatingCard(AssetImage('images/spojtile.png'),
                ColorSchemeClass.spojblue, userrating[3] + ' pts'),
          ),
        ));
    }

    setState(() {
      isFirstTimeUserRatings = false;
    });
  }

  Future futureFunctionUserData;
  Future futureFunctionUserRatings;

  @override
  void initState() {
    super.initState();
    futureFunctionUserData = readyUserData();
    futureFunctionUserRatings = readyUserRatings();
  }

  @override
  Widget build(BuildContext context) {
    return isFirstTimeUserData
        ? FutureBuilder(
            builder: (context, snapshot) {
              return MyDashboardScreenSkeleton();
            },
            future: futureFunctionUserData,
          )
        : Scaffold(
            body: SafeArea(
              child: Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.015),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: Center(
                          child: Image(
                              image: AssetImage('images/appiconnoback.png')),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.22,
                              width: MediaQuery.of(context).size.height * 0.22,
                              child:  MyCircleAvatar(Image.network(avatarurl))),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Text(
                            name,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'young',
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
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          isFirstTimeUserRatings
                              ? FutureBuilder(
                                  future: futureFunctionUserRatings,
                                  builder: (context, snapshot) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RantingTileSkeleton(),
                                              RantingTileSkeleton(),
                                            ]),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RantingTileSkeleton(),
                                              RantingTileSkeleton(),
                                            ])
                                      ],
                                    );
                                  })
                              : listOfRatingCards.length == 0
                                  ? Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          DottedBorder(
                                            strokeWidth: 1,
                                            dashPattern: [5, 5],
                                            color: ColorSchemeClass.lightgrey,
                                            child: Container(
                                              padding: EdgeInsets.all(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.05),
                                              child: Text(
                                                'NO RATINGS',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: ColorSchemeClass
                                                        .lightgrey,
                                                    fontFamily: 'young',
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.02),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Go to   ',
                                                style: TextStyle(
                                                    color: ColorSchemeClass
                                                        .lightgrey,
                                                    fontFamily: 'young',
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.02),
                                              ),
                                              Column(children: [
                                                Icon(
                                                  Icons.settings,
                                                  color: ColorSchemeClass
                                                      .primarygreen,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.08,
                                                ),
                                                Text(
                                                  'Settings',
                                                  style: TextStyle(
                                                      color: ColorSchemeClass
                                                          .primarygreen,
                                                      fontFamily: 'young',
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.016),
                                                ),
                                              ]),
                                              Text(
                                                '   to add User Handles',
                                                style: TextStyle(
                                                    color: ColorSchemeClass
                                                        .lightgrey,
                                                    fontFamily: 'young',
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.02),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : listOfRatingCards.length == 1 ||
                                          listOfRatingCards.length == 2
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: listOfRatingCards)
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: listOfRatingCards
                                                    .sublist(0, 2)),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: listOfRatingCards
                                                    .sublist(2))
                                          ],
                                        )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

class RantingTileSkeleton extends StatelessWidget {
  const RantingTileSkeleton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.25,
              child: RiveAnimation.asset(
                'assets/skeleton-place-holder.riv',
                fit: BoxFit.cover,
              ))),
    );
  }
}


/* */