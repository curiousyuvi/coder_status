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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool avatarIconOnOff = true;
  int idx = 2;
  String name = 'name', codername = 'codername', avatarurl = urls.avatar1url;
  List<String> userhandles = [null, null, null, null],
      userrating = [null, null, null, null];
  bool isloading = false;

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
  }

  CupertinoTabController tabController;
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

    List screenList = [
      SettingScreen(),
      SettingScreen(),
      mydashboardscreen(name, codername, avatarurl, userhandles, userrating),
      SettingScreen(),
      SettingScreen()
    ];

    return FutureBuilder(
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
            return Scaffold(
              body: Center(
                child: LoadingScreen(AssetImage('images/loading_rating.gif'),
                    "Fetching user's ratings..."),
              ),
            );
          }
        });
  }
}
