import 'dart:io';

import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/loadingScreen.dart';
import 'package:codersstatus/components/myAvatarButton.dart';
import 'package:codersstatus/components/urls.dart';
import 'package:codersstatus/firebase_layer/getUserInfo.dart';
import 'package:codersstatus/functions/getRating.dart';
import 'package:codersstatus/mydashboardscreen.dart';
import 'package:codersstatus/settingscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key key}) : super(key: key);

  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  bool avatarIconOnOff = true;
  int idx = 2;
  String name = 'name', codername = 'codername', avatarurl = urls.avatar1url;
  List<String> userhandles = [null, null, null, null],
      userrating = [null, null, null, null];
  bool isFirstTime = true;
  List<Widget> screenList;
  CupertinoTabController tabController;

  final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> fourthTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> fifthTabNavKey = GlobalKey<NavigatorState>();

  readyUserData() async {
    name = await GetUserInfo.getUserName();
    codername = await GetUserInfo.getUserCoderName();
    avatarurl = await GetUserInfo.getUserAvatarUrl();
    userhandles = await GetUserInfo.getUserHandles();

    userrating[0] = await GetRating.getCodeforcesRating(userhandles[0]);
    userrating[1] = await GetRating.getCodechefRating(userhandles[1]);
    userrating[2] = await GetRating.getAtcoderRating(userhandles[2]);
    userrating[3] = await GetRating.getSpojRating(userhandles[3]);
    screenList = [
      SettingScreen(),
      SettingScreen(),
      mydashboardscreen(name, codername, avatarurl, userhandles, userrating),
      SettingScreen(),
      SettingScreen()
    ];
    isFirstTime = false;
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit an App'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => exit(0),
                /*Navigator.of(context).pop(true)*/
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  void initState() {
    super.initState();
    tabController = CupertinoTabController(initialIndex: 2);
  }

  @override
  Widget build(BuildContext context) {
    final listOfKeys = [
      firstTabNavKey,
      secondTabNavKey,
      thirdTabNavKey,
      fourthTabNavKey,
      fifthTabNavKey
    ];

    return isFirstTime
        ? FutureBuilder(
            future: readyUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return WillPopScope(
                  onWillPop: () async {
                    return !await listOfKeys[tabController.index]
                        .currentState
                        .maybePop();
                  },
                  child: CupertinoTabScaffold(
                      controller: tabController,
                      tabBar: CupertinoTabBar(
                          backgroundColor: colorschemeclass.dark,
                          activeColor: colorschemeclass.primarygreen,
                          onTap: (val) {
                            setState(() {
                              if (val == 2) {
                                avatarIconOnOff = true;
                              } else {
                                avatarIconOnOff = false;
                              }
                            });
                          },
                          items: [
                            BottomNavigationBarItem(icon: Icon(Icons.list)),
                            BottomNavigationBarItem(icon: Icon(Icons.search)),
                            BottomNavigationBarItem(
                                icon: myAvatarButton(
                                    Image(
                                      image: NetworkImage(avatarurl),
                                    ),
                                    avatarIconOnOff)),
                            BottomNavigationBarItem(icon: Icon(Icons.people)),
                            BottomNavigationBarItem(icon: Icon(Icons.settings)),
                          ]),
                      tabBuilder: (context, index) {
                        return CupertinoTabView(
                            navigatorKey: listOfKeys[index],
                            builder: (context) {
                              return screenList[index];
                            });
                      }),
                );
              } else {
                return LoadingScreen(AssetImage('images/loading_rating.gif'),
                    'Fetching user\'s ratings...');
              }
            })
        : WillPopScope(
            onWillPop: () async {
              return !await listOfKeys[tabController.index]
                  .currentState
                  .maybePop();
            },
            child: CupertinoTabScaffold(
                controller: tabController,
                tabBar: CupertinoTabBar(
                    backgroundColor: colorschemeclass.dark,
                    activeColor: colorschemeclass.primarygreen,
                    onTap: (val) {
                      setState(() {
                        if (val == 2) {
                          avatarIconOnOff = true;
                        } else {
                          avatarIconOnOff = false;
                        }
                      });
                    },
                    items: [
                      BottomNavigationBarItem(icon: Icon(Icons.list)),
                      BottomNavigationBarItem(icon: Icon(Icons.search)),
                      BottomNavigationBarItem(
                          icon: myAvatarButton(
                              Image(
                                image: NetworkImage(avatarurl),
                              ),
                              avatarIconOnOff)),
                      BottomNavigationBarItem(icon: Icon(Icons.people)),
                      BottomNavigationBarItem(icon: Icon(Icons.settings)),
                    ]),
                tabBuilder: (context, index) {
                  return CupertinoTabView(
                      navigatorKey: listOfKeys[index],
                      builder: (context) {
                        return screenList[index];
                      });
                }),
          );
  }
}
