import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myAvatarButton.dart';
import 'package:codersstatus/components/ratingLoadingScreen.dart';
import 'package:codersstatus/components/urls.dart';
import 'package:codersstatus/firebase_layer/getUserInfo.dart';
import 'package:codersstatus/functions/getRating.dart';
import 'package:codersstatus/mydashboardscreen.dart';
import 'package:codersstatus/settingscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isFirstTimeFlag = true;
  String name = 'name', codername = 'codername', avatarurl = urls.avatar1url;
  List<String> userhandles = [null, null, null, null],
      userrating = [null, null, null, null];
  String _currentPage = "MyDashboardScreen";
  List<String> pageKeys = [
    "RankingScreen",
    "SearchScreen",
    "MyDashboardScreen",
    "PeersScreen",
    "SettingsScreen"
  ];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "RankingScreen": GlobalKey<NavigatorState>(),
    "SearchScreen": GlobalKey<NavigatorState>(),
    "MyDashboardScreen": GlobalKey<NavigatorState>(),
    "PeersScreen": GlobalKey<NavigatorState>(),
    "SettingsScreen": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 2;

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  readyUserData() async {
    name = await GetUserInfo.getUserName();
    codername = await GetUserInfo.getUserCoderName();
    avatarurl = await GetUserInfo.getUserAvatarUrl();
    userhandles = await GetUserInfo.getUserHandles();

    userrating[0] = await GetRating.getCodeforcesRating(userhandles[0]);
    userrating[1] = await GetRating.getCodechefRating(userhandles[1]);
    userrating[2] = await GetRating.getAtcoderRating(userhandles[2]);
    userrating[3] = await GetRating.getSpojRating(userhandles[3]);

    setState(() {
      isFirstTimeFlag = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isFirstTimeFlag
        ? FutureBuilder(
            future: readyUserData(),
            builder: (context, snapshot) {
              return RatingsLoadingScreen('FETCHING USER\'S RATINGS');
            })
        : WillPopScope(
            onWillPop: () async {
              final isFirstRouteInCurrentTab =
                  !await _navigatorKeys[_currentPage].currentState.maybePop();
              if (isFirstRouteInCurrentTab) {
                if (_currentPage != "MyDashboardScreen") {
                  _selectTab("MyDashBoardScreen", 2);

                  return false;
                }
              }
              // let system handle back button if we're on the first route
              return isFirstRouteInCurrentTab;
            },
            child: Scaffold(
              body: Stack(children: <Widget>[
                _buildOffstageNavigator("RankingScreen"),
                _buildOffstageNavigator("SearchScreen"),
                _buildOffstageNavigator("MyDashboardScreen"),
                _buildOffstageNavigator("PeersScreen"),
                _buildOffstageNavigator("SettingsScreen"),
              ]),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: colorschemeclass.dark,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                unselectedItemColor: colorschemeclass.lightgrey,
                unselectedLabelStyle: TextStyle(
                    color: colorschemeclass.lightgrey,
                    fontFamily: 'young',
                    fontSize: MediaQuery.of(context).size.height * 0.017),
                selectedLabelStyle: TextStyle(
                    color: colorschemeclass.primarygreen,
                    fontFamily: 'young',
                    fontSize: MediaQuery.of(context).size.height * 0.017),
                unselectedIconTheme: IconThemeData(
                    opacity: 0.7,
                    size: MediaQuery.of(context).size.height * 0.045,
                    color: colorschemeclass.lightgrey),
                selectedIconTheme: IconThemeData(
                    opacity: 1,
                    size: MediaQuery.of(context).size.height * 0.045,
                    color: colorschemeclass.primarygreen),
                onTap: (int index) {
                  _selectTab(pageKeys[index], index);
                },
                currentIndex: _selectedIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: (_selectedIndex == 0)
                        ? Icon(Icons.emoji_events)
                        : Icon(Icons.emoji_events_outlined),
                    label: 'Ranking',
                  ),
                  BottomNavigationBarItem(
                    icon: new Icon(CupertinoIcons.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: (_selectedIndex == 2)
                        ? myAvatarButton(Image.network(avatarurl), true)
                        : myAvatarButton(Image.network(avatarurl), false),
                    label: 'Profile',
                  ),
                  BottomNavigationBarItem(
                    icon: (_selectedIndex == 3)
                        ? Icon(CupertinoIcons.person_3_fill)
                        : Icon(CupertinoIcons.person_3),
                    label: 'Peers',
                  ),
                  BottomNavigationBarItem(
                    icon: (_selectedIndex == 4)
                        ? Icon(Icons.settings)
                        : Icon(Icons.settings_outlined),
                    label: 'Settings',
                  ),
                ],
                type: BottomNavigationBarType.fixed,
              ),
            ),
          );
  }

  /* Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}*/

  Widget _buildOffstageNavigator(String tabItem) {
    Widget child;
    if (tabItem == "RankingScreen")
      child = SettingScreen();
    else if (tabItem == "SearchScreen")
      child = SettingScreen();
    else if (tabItem == "MyDashboardScreen")
      child = mydashboardscreen(
          name, codername, avatarurl, userhandles, userrating);
    else if (tabItem == "PeersScreen")
      child = SettingScreen();
    else if (tabItem == "SettingsScreen") child = SettingScreen();

    return Offstage(
        offstage: _currentPage != tabItem,
        child: Navigator(
          key: _navigatorKeys[tabItem],
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(builder: (context) => child);
          },
        ));
  }
}
