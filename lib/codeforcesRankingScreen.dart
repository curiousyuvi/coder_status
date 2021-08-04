import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myAppBarWithBack.dart';
import 'package:codersstatus/components/myRankingUserTile.dart';
import 'package:codersstatus/firebase_layer/getUserInfo.dart';
import 'package:codersstatus/functions/getRating.dart';
import 'package:flutter/material.dart';

class CodeforcesRankingScreen extends StatefulWidget {
  const CodeforcesRankingScreen({Key key}) : super(key: key);

  @override
  _CodeforcesRankingScreenState createState() =>
      _CodeforcesRankingScreenState();
}

class _CodeforcesRankingScreenState extends State<CodeforcesRankingScreen> {
  List<Widget> listOfUserTiles = [];
  bool isFirstTime = true;
  var listOfUserData = [];

  getPeersList() async {
    listOfUserTiles = [];
    listOfUserData = [];
    var myAvatarurl = await GetUserInfo.getUserAvatarUrl();
    var myUserHandles = await GetUserInfo.getUserHandles();
    var myRating = await GetRating.getCodeforcesRating(myUserHandles[0]);
    listOfUserData.add({
      'avatarurl': myAvatarurl,
      'userHandle': myUserHandles[0],
      'rating': myRating
    });
    print('initial map data added');
    var peers = await GetUserInfo.getUserPeers();
    if (peers.length != 0) {
      for (int i = 0; i < peers.length; i++) {
        var peerDocument = await GetUserInfo.getUserDocument(peers[i]);
        var rating =
            await GetRating.getCodeforcesRating(peerDocument['codeforces']);
        for (int j = 0; j < listOfUserData.length; j++) {
          if (j == (listOfUserData.length - 1)) {
            if (j == 0) {
              if (int.parse(listOfUserData[0]['rating']) <= int.parse(rating)) {
                listOfUserData.insert(0, {
                  'avatarurl': peerDocument['avatarurl'],
                  'userHandle': peerDocument['codeforces'],
                  'rating': rating
                });
                break;
              } else {
                listOfUserData.add({
                  'avatarurl': peerDocument['avatarurl'],
                  'userHandle': peerDocument['codeforces'],
                  'rating': rating
                });
                break;
              }
            } else {
              listOfUserData.add({
                'avatarurl': peerDocument['avatarurl'],
                'userHandle': peerDocument['codeforces'],
                'rating': rating
              });
              break;
            }
          } else if (int.parse(listOfUserData[j]['rating']) <=
              int.parse(rating)) {
            listOfUserData.insert(j, {
              'avatarurl': peerDocument['avatarurl'],
              'userHandle': peerDocument['codeforces'],
              'rating': rating
            });
            break;
          }
        }
        print('peer data map added');
      }
      for (int j = 0; j < listOfUserData.length; j++) {
        listOfUserTiles.add(MyRankingUserTile(
            listOfUserData[j]['avatarurl'],
            listOfUserData[j]['userHandle'],
            listOfUserData[j]['rating'],
            (j + 1)));
      }
      print('widgets added');
    }
    setState(() {
      isFirstTime = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: MyAppBarWithBack('Codeforces Ranking'),
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
      ),
      body: isFirstTime
          ? FutureBuilder(
              future: getPeersList(),
              builder: (context, snapshot) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          : listOfUserTiles.length == 0
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You haven\'t added any Peers those are on Codeforces',
                          style: TextStyle(
                              color: ColorSchemeClass.lightgrey,
                              fontFamily: 'young',
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFirstTime = true;
                            });
                          },
                          child: Text(
                            'Refresh',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: ColorSchemeClass.primarygreen,
                                fontFamily: 'young',
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.028),
                          ),
                        ),
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
