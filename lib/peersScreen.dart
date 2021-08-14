import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myAppBar.dart';
import 'package:codersstatus/components/myButton.dart';
import 'package:codersstatus/components/myUserTile.dart';
import 'package:codersstatus/components/peerScreenSkeleton.dart';
import 'package:codersstatus/firebase_layer/getUserInfo.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PeersScreen extends StatefulWidget {
  const PeersScreen({Key key}) : super(key: key);

  @override
  _PeersScreenState createState() => _PeersScreenState();
}

class _PeersScreenState extends State<PeersScreen> {
  List<Widget> listOfUserTiles = [];
  bool isFirstTime = true;

  getPeersList() async {
    listOfUserTiles = [];
    var peers = await GetUserInfo.getUserPeers();

    if (peers.length != 0) {
      for (int i = 0; i < peers.length; i++) {
        try {
          var peerDocument = await GetUserInfo.getUserDocument(peers[i]);
          print('getting peers list $i');
          listOfUserTiles.add(MyUserTile(
              peerDocument['id'],
              peerDocument['avatarurl'],
              peerDocument['name'],
              peerDocument['codername']));
        } catch (e) {}
      }
    }
    setState(() {
      isFirstTime = false;
    });
  }

  Future futureFunction;

  @override
  void initState() {
    super.initState();
    futureFunction = getPeersList();
  }

  @override
  Widget build(BuildContext context) {
    return isFirstTime
        ? FutureBuilder(
            future: futureFunction,
            builder: (context, snapshot) {
              return PeersScreenSkeleton();
            },
          )
        : Scaffold(
            appBar: PreferredSize(
              child: MyAppBar('Peers'),
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
            ),
            body: listOfUserTiles.length == 0
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width * 0.9,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: RiveAnimation.asset('assets/no-peers.riv'),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          DottedBorder(
                            strokeWidth: 1,
                            dashPattern: [5, 5],
                            color: ColorSchemeClass.lightgrey,
                            child: Container(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.04),
                              child: Text(
                                'You haven\'t added any Peers',
                                style: TextStyle(
                                    color: ColorSchemeClass.lightgrey,
                                    fontFamily: 'young',
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Go to   ',
                                style: TextStyle(
                                    color: ColorSchemeClass.lightgrey,
                                    fontFamily: 'young',
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02),
                              ),
                              Column(children: [
                                Icon(
                                  CupertinoIcons.search,
                                  color: ColorSchemeClass.primarygreen,
                                  size:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                                Text(
                                  'Search',
                                  style: TextStyle(
                                      color: ColorSchemeClass.primarygreen,
                                      fontFamily: 'young',
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.016),
                                ),
                              ]),
                              Text(
                                '   to add Peers',
                                style: TextStyle(
                                    color: ColorSchemeClass.lightgrey,
                                    fontFamily: 'young',
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: MyButton(
                                ColorSchemeClass.primarygreen, 'Refresh', () {
                              setState(() {
                                futureFunction = getPeersList();
                                isFirstTime = true;
                              });
                            }),
                          )
                        ],
                      ),
                    ),
                  )
                : RefreshIndicator(
                    backgroundColor: ColorSchemeClass.unactivatedblack,
                    onRefresh: () async {
                      await getPeersList();
                      return 0;
                    },
                    child: ListView(
                      children: listOfUserTiles,
                    ),
                  ),
          );
  }
}
