import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myAppBarWithBack.dart';
import 'package:codersstatus/components/myRankingUserTile.dart';
import 'package:codersstatus/firebase_layer/getUserInfo.dart';
import 'package:codersstatus/functions/getRating.dart';
import 'package:flutter/material.dart';

class AtcoderRankingScreen extends StatefulWidget {
  const AtcoderRankingScreen({Key key}) : super(key: key);

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
      print('my rating fetched');

      //if I have rating other than 0 only then add me to ranking data
      if (myRating != '0') {
        listOfUserData.add({
          'avatarurl': myAvatarurl,
          'userHandle': myUserHandles[2],
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
        if (peerDocument['atcoder'] != '') {
          //fetch rating for the current peer
          var rating =
              await GetRating.getAtcoderRating(peerDocument['atcoder']);
          print('peer\'s rating fetched');

          //if current peer has rating not equal to zero then add it to ranking data
          if (rating != '0') {
            //if initial list is not empty add to ranking data in descending sort
            if (listOfUserData.length > 0) {
              for (int j = 0; j < listOfUserData.length; j++) {
                if (j == (listOfUserData.length - 1)) {
                  if (j == 0) {
                    if (double.parse(listOfUserData[0]['rating']) <=
                        double.parse(rating)) {
                      listOfUserData.insert(0, {
                        'avatarurl': peerDocument['avatarurl'],
                        'userHandle': peerDocument['atcoder'],
                        'rating': rating
                      });
                      print('peer data map added');
                      break;
                    } else {
                      listOfUserData.add({
                        'avatarurl': peerDocument['avatarurl'],
                        'userHandle': peerDocument['atcoder'],
                        'rating': rating
                      });
                      print('peer data map added');
                      break;
                    }
                  } else {
                    listOfUserData.add({
                      'avatarurl': peerDocument['avatarurl'],
                      'userHandle': peerDocument['atcoder'],
                      'rating': rating
                    });
                    print('peer data map added');
                    break;
                  }
                } else if (double.parse(listOfUserData[j]['rating']) <=
                    double.parse(rating)) {
                  listOfUserData.insert(j, {
                    'avatarurl': peerDocument['avatarurl'],
                    'userHandle': peerDocument['atcoder'],
                    'rating': rating
                  });
                  print('peer data map added');
                  break;
                }
              }
            } else {
              //since initial list is empty
              listOfUserData.add({
                'avatarurl': peerDocument['avatarurl'],
                'userHandle': peerDocument['atcoder'],
                'rating': rating
              });
              print('peer data map added');
            }
          }
        }
        print('peer data map may be skipped');
      }

      //converting ranking data into widgets
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
        child: MyAppBarWithBack('Atcoder Ranking'),
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
                          'You and your peers are not on Atcoder',
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