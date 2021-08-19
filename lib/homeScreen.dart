import 'dart:async';

import 'package:coderstatus/components/colorscheme.dart';
import 'package:coderstatus/components/urls.dart';
import 'package:coderstatus/firebase_layer/getUserInfo.dart';
import 'package:coderstatus/myDashboardScreen.dart';
import 'package:coderstatus/peersScreen.dart';
import 'package:coderstatus/rankingScreen.dart';
import 'package:coderstatus/searchScreen.dart';
import 'package:coderstatus/settingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'components/generalLoader.dart';
import 'components/myAvatarButton.dart';
import 'noInternet.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  StreamSubscription subscription;
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
    if (!await InternetConnectionChecker().hasConnection) {
      NoInternet(this.context);
      return;
    }
    avatarurl = await GetUserInfo.getUserAvatarUrl();

    setState(() {
      isFirstTimeFlag = false;
    });
  }

  Future futureFunction;

  @override
  Future<void> initState() {
    super.initState();
    futureFunction = readyUserData();

    subscription = InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;

      if (!hasInternet) NoInternet(this.context);
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isFirstTimeFlag
        ? FutureBuilder(
            future: futureFunction,
            builder: (context, snapshot) {
              return Scaffold(
                body: GeneralLoader(''),
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
                      size: MediaQuery.of(context).size.height * 0.04,
                      color: ColorSchemeClass.lightgrey),
                  selectedIconTheme: IconThemeData(
                      opacity: 1,
                      size: MediaQuery.of(context).size.height * 0.04,
                      color: ColorSchemeClass.primarygreen),
                  onTap: (int index) {
                    _selectTab(pageKeys[index], index);
                  },
                  currentIndex: _selectedIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: (_selectedIndex == 0)
                          ? FaIcon(FontAwesomeIcons.trophy)
                          : Icon(Icons.emoji_events_outlined),
                      label: 'Ranking',
                    ),
                    BottomNavigationBarItem(
                      icon: (_selectedIndex == 1)
                          ? FaIcon(FontAwesomeIcons.search)
                          : Icon(Icons.search),
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
                          ? FaIcon(FontAwesomeIcons.users)
                          : Icon(CupertinoIcons.person_3),
                      label: 'Peers',
                    ),
                    BottomNavigationBarItem(
                      icon: (_selectedIndex == 4)
                          ? FaIcon(FontAwesomeIcons.cog)
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
