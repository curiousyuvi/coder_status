import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myAppBar.dart';
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
                        fontWeight: FontWeight.bold,
                        fontFamily: 'young',
                        fontSize: MediaQuery.of(context).size.height * 0.033),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: MediaQuery.of(context).size.width * 0.1,
                    crossAxisSpacing: MediaQuery.of(context).size.width * 0.1,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.35,
                        width: MediaQuery.of(context).size.width * 0.35,
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
                                image:
                                    AssetImage('images/codeforcesSquare.jpg'))),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width * 0.35,
                        width: MediaQuery.of(context).size.width * 0.35,
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
                                image:
                                    AssetImage('images/codechefSquare.jpg'))),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width * 0.35,
                        width: MediaQuery.of(context).size.width * 0.35,
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
                                image: AssetImage('images/atcoderSquare.jpg'))),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width * 0.35,
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    ColorSchemeClass.spojblue.withOpacity(0.5),
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
                                image: AssetImage('images/spojSquare.jpg'))),
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

/* */