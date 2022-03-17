import 'package:coder_status/components/colorscheme.dart';
import 'package:coder_status/components/myRankingUserTile.dart';
import 'package:coder_status/components/rankingScreenSkeleton.dart';
import 'package:coder_status/firebase_layer/getUserInfo.dart';
import 'package:coder_status/functions/getRating.dart';
import 'package:flutter/material.dart';
import '../components/myAppBar.dart';
import '../components/myButtons.dart';
import '../components/topThreeRankingCard.dart';

class AtcoderRankingScreen extends StatefulWidget {
  @override
  _AtcoderRankingScreenState createState() => _AtcoderRankingScreenState();
}

class _AtcoderRankingScreenState extends State<AtcoderRankingScreen> {
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
    if (myUserHandles[2] != "") {
      var myRating = await GetRating.getAtcoderRating(myUserHandles[2]);

      //if I have rating other than 0 only then add me to ranking data
      if (myRating != '0') {
        listOfUserData.add({
          'avatarurl': myAvatarurl,
          'userHandle': myUserHandles[2],
          'rating': myRating
        });
      }
    }
    //getting list of uids of my peers
    var peers = await GetUserInfo.getUserPeers();

    //If I have peers only then proceed
    if (peers.length > 0) {
      //loop through all peer uids
      for (int i = 0; i < peers.length; i++) {
        //get document map of uid
        var peerDocument = await GetUserInfo.getUserDocument(peers[i]);

        //if the peer's document map has user Handle then then add it to ranking data
        try {
          if (peerDocument['atcoder'] != '') {
            //fetch rating for the current peer
            var rating =
                await GetRating.getAtcoderRating(peerDocument['atcoder']);

            //if current peer has rating not equal to zero then add it to ranking data
            if (rating != '0') {
              //if initial list is not empty add to ranking data in descending sort
              if (listOfUserData.length > 0) {
                for (int j = 0; j < listOfUserData.length; j++) {
                  if (double.parse(listOfUserData[j]['rating']) <=
                      double.parse(rating)) {
                    listOfUserData.insert(j, {
                      'avatarurl': peerDocument['avatarurl'],
                      'userHandle': peerDocument['atcoder'],
                      'rating': rating
                    });
                    break;
                  } else {
                    if (j == (listOfUserData.length - 1)) {
                      listOfUserData.add({
                        'avatarurl': peerDocument['avatarurl'],
                        'userHandle': peerDocument['atcoder'],
                        'rating': rating
                      });
                      break;
                    }
                  }
                }
              } else {
                //since initial list is empty
                listOfUserData.add({
                  'avatarurl': peerDocument['avatarurl'],
                  'userHandle': peerDocument['atcoder'],
                  'rating': rating
                });
              }
            }
          }
        } catch (e) {
          continue;
        }
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
    } else {
      for (int j = 0; j < listOfUserData.length; j++) {
        listOfUserTiles.add(MyRankingUserTile(
            listOfUserData[j]['avatarurl'],
            listOfUserData[j]['userHandle'],
            listOfUserData[j]['rating'],
            (j + 1)));
      }
    }
    setState(() {
      isFirstTime = false;
    });
  }

  Future? futureFunction;

  @override
  void initState() {
    super.initState();
    futureFunction = getPeersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: MyAppBarWithBack('Atcoder Ranking'),
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
      ),
      body: isFirstTime
          ? FutureBuilder(
              future: futureFunction,
              builder: (context, snapshot) {
                return Center(
                  child: RankingScreenSkeleton(),
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
                          'You and your peers are not on Atcoder',
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
                        )
                      ],
                    ),
                  ),
                )
              : RefreshIndicator(
                  backgroundColor: ColorSchemeClass.unactivatedblack,
                  onRefresh: () async {
                    await getPeersList();
                    return;
                  },
                  child: ListView(
                    children: listOfUserTiles,
                  ),
                ),
    );
  }
}
