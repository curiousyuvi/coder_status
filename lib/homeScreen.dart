import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myAvatarButton.dart';
import 'package:codersstatus/components/ratingLoadingScreen.dart';
import 'package:codersstatus/components/urls.dart';
import 'package:codersstatus/firebase_layer/getUserInfo.dart';
import 'package:codersstatus/functions/getRatingFromAPI.dart';
import 'package:codersstatus/myDashboardScreen.dart';
import 'package:codersstatus/peersScreen.dart';
import 'package:codersstatus/rankingScreen.dart';
import 'package:codersstatus/searchScreen.dart';
import 'package:codersstatus/settingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isFirstTimeFlag = true;
  String avatarurl = Urls.avatar1url;
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
    avatarurl = await GetUserInfo.getUserAvatarUrl();

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
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
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
              bottomNavigationBar: Theme(
                data: ThemeData(
                    splashColor: Colors.transparent,
                    primaryColor: ColorSchemeClass.primarygreen,
                    accentColor: ColorSchemeClass.primarygreen),
                child: BottomNavigationBar(
                  backgroundColor: ColorSchemeClass.dark,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  unselectedItemColor: ColorSchemeClass.lightgrey,
                  unselectedLabelStyle: TextStyle(
                      color: ColorSchemeClass.lightgrey,
                      fontFamily: 'young',
                      fontSize: MediaQuery.of(context).size.height * 0.017),
                  selectedLabelStyle: TextStyle(
                      color: ColorSchemeClass.primarygreen,
                      fontFamily: 'young',
                      fontSize: MediaQuery.of(context).size.height * 0.017),
                  unselectedIconTheme: IconThemeData(
                      opacity: 0.7,
                      size: MediaQuery.of(context).size.height * 0.045,
                      color: ColorSchemeClass.lightgrey),
                  selectedIconTheme: IconThemeData(
                      opacity: 1,
                      size: MediaQuery.of(context).size.height * 0.045,
                      color: ColorSchemeClass.primarygreen),
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
                          ? MyAvatarButton(Image.network(avatarurl), true)
                          : MyAvatarButton(Image.network(avatarurl), false),
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
      child = RankingScreen();
    else if (tabItem == "SearchScreen")
      child = SearchScreen();
    else if (tabItem == "MyDashboardScreen")
      child = MyDashboardScreen();
    else if (tabItem == "PeersScreen")
      child = PeersScreen();
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
