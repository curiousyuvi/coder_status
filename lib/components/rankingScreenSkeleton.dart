import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'colorscheme.dart';
import 'myAppBar.dart';

class RankingScreenSkeleton extends StatefulWidget {
  @override
  _RankingScreenSkeletonState createState() => _RankingScreenSkeletonState();
}

class _RankingScreenSkeletonState extends State<RankingScreenSkeleton> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TopThreeSkeleton(),
        MyRankingUserTileSkeleton(4),
        MyRankingUserTileSkeleton(5),
        MyRankingUserTileSkeleton(6),
        MyRankingUserTileSkeleton(7),
        MyRankingUserTileSkeleton(8),
        MyRankingUserTileSkeleton(9),
        MyRankingUserTileSkeleton(10)
      ],
    );
  }
}

class TopThreeSkeleton extends StatelessWidget {
  const TopThreeSkeleton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.45,
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_drop_down,
                          color: ColorSchemeClass.lightgrey,
                          size: MediaQuery.of(context).size.height * 0.032,
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '2',
                            style: TextStyle(
                                color: ColorSchemeClass.lightgrey,
                                fontFamily: 'young',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.032),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                              height: MediaQuery.of(context).size.width * 0.3,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: RiveAnimation.asset(
                                'assets/skeleton-place-holder.riv',
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        /*Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '@' + userhandle2,
                              style: TextStyle(
                                  color: ColorSchemeClass.lightgrey,
                                  fontFamily: 'young',
                                  fontSize:
                                      MediaQuery.of(context).size.height *
                                          0.03),
                            ),
                          ),
                        ),*/
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: RiveAnimation.asset(
                                'assets/skeleton-place-holder.riv',
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        /*FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            userRating2 + ' pts',
                            style: TextStyle(
                                color: ColorSchemeClass.primarygreen,
                                fontFamily: 'young',
                                fontSize:
                                    MediaQuery.of(context).size.height *
                                        0.04),
                          ),
                        )*/
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: double.infinity,
                              child: RiveAnimation.asset(
                                'assets/skeleton-place-holder.riv',
                                fit: BoxFit.cover,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_drop_down,
                            color: ColorSchemeClass.lightgrey,
                            size: MediaQuery.of(context).size.height * 0.032,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '3',
                              style: TextStyle(
                                  color: ColorSchemeClass.lightgrey,
                                  fontFamily: 'young',
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.032),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                                height: MediaQuery.of(context).size.width * 0.3,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: RiveAnimation.asset(
                                  'assets/skeleton-place-holder.riv',
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: RiveAnimation.asset(
                                  'assets/skeleton-place-holder.riv',
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          /*FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              userRating3 + ' pts',
                              style: TextStyle(
                                  color: ColorSchemeClass.primarygreen,
                                  fontFamily: 'young',
                                  fontSize:
                                      MediaQuery.of(context).size.height *
                                          0.04),
                            ),
                          )*/
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: double.infinity,
                                child: RiveAnimation.asset(
                                  'assets/skeleton-place-holder.riv',
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_drop_down,
                    color: ColorSchemeClass.lightgrey,
                    size: MediaQuery.of(context).size.height * 0.032,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '1',
                      style: TextStyle(
                          color: ColorSchemeClass.lightgrey,
                          fontFamily: 'young',
                          fontSize: MediaQuery.of(context).size.height * 0.032),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.height * 0.05,
                    child: RiveAnimation.asset('assets/crown.riv'),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                        height: MediaQuery.of(context).size.width * 0.4,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: RiveAnimation.asset(
                          'assets/skeleton-place-holder.riv',
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  /*Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '@' + userhandle1,
                        style: TextStyle(
                            color: ColorSchemeClass.lightgrey,
                            fontFamily: 'young',
                            fontSize: MediaQuery.of(context).size.height *
                                0.025),
                      ),
                    ),
                  ),*/
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.025,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: RiveAnimation.asset(
                          'assets/skeleton-place-holder.riv',
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  /*FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      userRating1 + ' pts',
                      style: TextStyle(
                          color: ColorSchemeClass.primarygreen,
                          fontFamily: 'young',
                          fontSize:
                              MediaQuery.of(context).size.height * 0.04),
                    ),
                  )*/
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: double.infinity,
                        child: RiveAnimation.asset(
                          'assets/skeleton-place-holder.riv',
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyRankingUserTileSkeleton extends StatelessWidget {
  int rank;
  MyRankingUserTileSkeleton(this.rank);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
          vertical: MediaQuery.of(context).size.width * 0.01),
      child: ListTile(
        title: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.play_arrow,
                      size: MediaQuery.of(context).size.width * 0.05,
                      color: ColorSchemeClass.lightgrey,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.015,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.03,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          rank.toString(),
                          style: TextStyle(
                              color: ColorSchemeClass.lightgrey,
                              fontFamily: 'young',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                  color: ColorSchemeClass.unactivatedblack,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                        color: ColorSchemeClass.darkgrey.withOpacity(0.3),
                        offset: Offset(
                          0,
                          MediaQuery.of(context).size.height * 0.005,
                        ),
                        blurRadius: 0,
                        spreadRadius: 0)
                  ]),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.height * 0.08,
                        child: RiveAnimation.asset(
                          'assets/skeleton-place-holder.riv',
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                            width: MediaQuery.of(context).size.width * 0.24,
                            child: RiveAnimation.asset(
                              'assets/skeleton-place-holder.riv',
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: RiveAnimation.asset(
                              'assets/skeleton-place-holder.riv',
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
