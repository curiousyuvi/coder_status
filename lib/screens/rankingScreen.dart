import 'package:CoderStatus/screens/atcoderRankingScreen.dart';
import 'package:CoderStatus/screens/codechefRankingScreen.dart';
import 'package:CoderStatus/screens/codeforcesRankingScreen.dart';
import 'package:CoderStatus/components/colorscheme.dart';
import 'package:CoderStatus/components/myAppBar.dart';
import 'package:CoderStatus/screens/spojRankingScreen.dart';
import 'package:flutter/material.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({Key key}) : super(key: key);

  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: MyAppBar('Ranking'),
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
          child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Choose Platform',
                    style: TextStyle(
                        color: ColorSchemeClass.lightgrey,
                        fontFamily: 'young',
                        fontSize: MediaQuery.of(context).size.height * 0.033),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'Choose a platform to view a ranklist among your peers',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorSchemeClass.darkgrey,
                        fontFamily: 'young',
                        fontSize: MediaQuery.of(context).size.height * 0.023),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: MediaQuery.of(context).size.width * 0.07,
                      crossAxisSpacing:
                          MediaQuery.of(context).size.width * 0.07,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CodeforcesRankingScreen();
                            }));
                          },
                          child: Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.02),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorSchemeClass.codeforcespurple
                                        .withOpacity(0.5),
                                    width: 2),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorSchemeClass.codeforcespurple
                                          .withOpacity(0.2),
                                      offset: Offset(
                                          0,
                                          MediaQuery.of(context).size.height *
                                              0.007))
                                ],
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'images/codeforcesSquare.jpg'))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CodechefRankingScreen();
                            }));
                          },
                          child: Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.02),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorSchemeClass.codechefbrown
                                        .withOpacity(0.5),
                                    width: 2),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorSchemeClass.codechefbrown
                                          .withOpacity(0.2),
                                      offset: Offset(
                                          0,
                                          MediaQuery.of(context).size.height *
                                              0.007))
                                ],
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'images/codechefSquare.jpg'))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AtcoderRankingScreen();
                            }));
                          },
                          child: Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.02),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorSchemeClass.atcodergrey
                                        .withOpacity(0.5),
                                    width: 2),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorSchemeClass.atcodergrey
                                          .withOpacity(0.2),
                                      offset: Offset(
                                          0,
                                          MediaQuery.of(context).size.height *
                                              0.007))
                                ],
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'images/atcoderSquare.jpg'))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SpojRankingScreen();
                            }));
                          },
                          child: Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.02),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorSchemeClass.spojblue
                                        .withOpacity(0.5),
                                    width: 2),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorSchemeClass.spojblue
                                          .withOpacity(0.2),
                                      offset: Offset(
                                          0,
                                          MediaQuery.of(context).size.height *
                                              0.007))
                                ],
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image:
                                        AssetImage('images/spojSquare.jpg'))),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

/* */