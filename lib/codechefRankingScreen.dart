import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myRankingUserTile.dart';
import 'package:codersstatus/components/rankingScreenSkeleton.dart';
import 'package:codersstatus/firebase_layer/getUserInfo.dart';
import 'package:codersstatus/functions/getRatingFromAPI.dart';
import 'package:flutter/material.dart';

import 'components/myAppBar.dart';
import 'components/myButton.dart';
import 'components/topThreeRankingCard.dart';

class CodechefRankingScreen extends StatefulWidget {
  const CodechefRankingScreen({Key key}) : super(key: key);

  @override
  _CodechefRankingScreenState createState() => _CodechefRankingScreenState();
}

class _CodechefRankingScreenState extends State<CodechefRankingScreen> {
  List<Widget> listOfUserTiles = [];
  bool isFirstTime = true;
  var listOfUserData = [];

  getPeersList() async {
    //initializing the lists empty
    listOfUserTiles = [];
    listOfUserData = [];

    //getting my own map data
    var myAvatarurl = await GetUserInfo.getUserAvatarUrl();
    var myUserHandles = await GetUserInfo.getUserHandles();

    //if I have that handle only then add me to ranking data
    if (myUserHandles[1] != "") {
      var myRating = await GetRatingFromAPI.getCodechefRating(myUserHandles[1]);
      print('my rating fetched');

      //if I have rating other than 0 only then add me to ranking data
      if (myRating != '0') {
        listOfUserData.add({
          'avatarurl': myAvatarurl,
          'userHandle': myUserHandles[1],
          'rating': myRating
        });
        print('initial map data added');
      }
    }
    print('initial map data may be skipped');
    //getting list of uids of my peers
    var peers = await GetUserInfo.getUserPeers();

    //If I have peers only then proceed
    if (peers.length > 0) {
      //loop through all peer uids
      for (int i = 0; i < peers.length; i++) {
        //get document map of uid
        var peerDocument = await GetUserInfo.getUserDocument(peers[i]);
        print('peer\'s document fetched');

        //if the peer's document map has user Handle then then add it to ranking data
        if (peerDocument['codechef'] != '') {
          //fetch rating for the current peer
          var rating = await GetRatingFromAPI.getCodechefRating(
              peerDocument['codechef']);
          print('peer\'s rating fetched');

          //if current peer has rating not equal to zero then add it to ranking data
          if (rating != '0') {
            //if initial list is not empty add to ranking data in descending sort
            if (listOfUserData.length > 0) {
              for (int j = 0; j < listOfUserData.length; j++) {
                if (double.parse(listOfUserData[j]['rating']) <=
                    double.parse(rating)) {
                  listOfUserData.insert(j, {
                    'avatarurl': peerDocument['avatarurl'],
                    'userHandle': peerDocument['codechef'],
                    'rating': rating
                  });
                  print('peer data map added');
                  break;
                } else {
                  if (j == (listOfUserData.length - 1)) {
                    listOfUserData.add({
                      'avatarurl': peerDocument['avatarurl'],
                      'userHandle': peerDocument['codechef'],
                      'rating': rating
                    });
                    print('peer data map added');
                    break;
                  }
                }
              }
            } else {
              //since initial list is empty
              listOfUserData.add({
                'avatarurl': peerDocument['avatarurl'],
                'userHandle': peerDocument['codechef'],
                'rating': rating
              });
              print('peer data map added');
            }
          }
        }
        print('peer data map may be skipped');
      }

      //converting ranking data into widgets

    }
    if (listOfUserData.length >= 3) {
      listOfUserTiles.add(TopThreeRankingCard(
          listOfUserData[0]['avatarurl'],
          listOfUserData[1]['avatarurl'],
          listOfUserData[2]['avatarurl'],
          listOfUserData[0]['userHandle'],
          listOfUserData[1]['userHandle'],
          listOfUserData[2]['userHandle'],
          listOfUserData[0]['rating'],
          listOfUserData[1]['rating'],
          listOfUserData[2]['rating']));

      for (int j = 3; j < listOfUserData.length; j++) {
        listOfUserTiles.add(MyRankingUserTile(
            listOfUserData[j]['avatarurl'],
            listOfUserData[j]['userHandle'],
            listOfUserData[j]['rating'],
            (j + 1)));
      }
      print('widgets added');
    } else {
      for (int j = 0; j < listOfUserData.length; j++) {
        listOfUserTiles.add(MyRankingUserTile(
            listOfUserData[j]['avatarurl'],
            listOfUserData[j]['userHandle'],
            listOfUserData[j]['rating'],
            (j + 1)));
      }
      print('widgets added');
    }
    print('widgets added');
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
              return Center(
                child: RankingScreenSkeleton(),
              );
            },
          )
        : Scaffold(
            appBar: PreferredSize(
              child: MyAppBarWithBack('Codechef Ranking'),
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
                          Text(
                            'You and your peers are not on Codechef',
                            style: TextStyle(
                                color: ColorSchemeClass.lightgrey,
                                fontFamily: 'young',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
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
                            }, Icons.refresh),
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
