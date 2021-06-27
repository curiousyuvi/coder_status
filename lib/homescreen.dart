import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/loadingScreen.dart';
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
  int idx = 2;
  String name = 'name', codername = 'codername', avatarurl = urls.avatar1url;
  List<String> userhandles, userrating;
  bool isloading = false;

  readyUserData() async {
    name = await GetUserInfo.getUserName();
    codername = await GetUserInfo.getUserCoderName();
    avatarurl = await GetUserInfo.getUserAvatarUrl();
    userhandles = await GetUserInfo.getUserHandles();
    userrating = [null, null, null, null];

    userrating[0] = await GetRating.getCodeforcesRating(userhandles[0]);
    userrating[1] = await GetRating.getCodechefRating(userhandles[1]);
    userrating[2] = await GetRating.getAtcoderRating(userhandles[2]);
    userrating[3] = await GetRating.getSpojRating(userhandles[3]);
  }

  @override
  Widget build(BuildContext context) {
    if (name == 'name')
      return FutureBuilder(
          future: readyUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CupertinoTabScaffold(
                  tabBar: CupertinoTabBar(
                      backgroundColor: colorschemeclass.dark,
                      activeColor: colorschemeclass.primarygreen,
                      currentIndex: idx,
                      onTap: (val) {
                        setState(() {
                          idx = val;
                        });
                      },
                      items: [
                        BottomNavigationBarItem(icon: Icon(Icons.list)),
                        BottomNavigationBarItem(icon: Icon(Icons.search)),
                        BottomNavigationBarItem(
                            icon: CircleAvatar(
                          backgroundImage: NetworkImage(avatarurl),
                        )),
                        BottomNavigationBarItem(icon: Icon(Icons.people)),
                        BottomNavigationBarItem(icon: Icon(Icons.settings)),
                      ]),
                  tabBuilder: (context, index) {
                    return CupertinoTabView(builder: (context) {
                      switch (index) {
                        case 0:
                          return CupertinoPageScaffold(child: SettingScreen());
                        case 1:
                          return CupertinoPageScaffold(child: SettingScreen());
                        case 2:
                          return CupertinoPageScaffold(
                              child: mydashboardscreen(name, codername,
                                  avatarurl, userhandles, userrating));
                        case 3:
                          return CupertinoPageScaffold(child: SettingScreen());
                        case 4:
                          return CupertinoPageScaffold(child: SettingScreen());
                        default:
                          return CupertinoPageScaffold(child: SettingScreen());
                      }
                    });
                  });
            } else {
              return Scaffold(
                body: Center(
                  child: LoadingScreen(),
                ),
              );
            }
          });
    else
      return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
              backgroundColor: colorschemeclass.dark,
              activeColor: colorschemeclass.primarygreen,
              currentIndex: idx,
              onTap: (val) {
                setState(() {
                  idx = val;
                });
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.list)),
                BottomNavigationBarItem(icon: Icon(Icons.search)),
                BottomNavigationBarItem(
                    icon: CircleAvatar(
                  backgroundImage: NetworkImage(avatarurl),
                )),
                BottomNavigationBarItem(icon: Icon(Icons.people)),
                BottomNavigationBarItem(icon: Icon(Icons.settings)),
              ]),
          tabBuilder: (context, index) {
            return CupertinoTabView(builder: (context) {
              switch (index) {
                case 0:
                  return CupertinoPageScaffold(child: SettingScreen());
                case 1:
                  return CupertinoPageScaffold(child: SettingScreen());
                case 2:
                  return CupertinoPageScaffold(
                      child: mydashboardscreen(
                          name, codername, avatarurl, userhandles, userrating));
                case 3:
                  return CupertinoPageScaffold(child: SettingScreen());
                case 4:
                  return CupertinoPageScaffold(child: SettingScreen());
                default:
                  return CupertinoPageScaffold(child: SettingScreen());
              }
            });
          });
  }
}
