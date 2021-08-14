import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'myDividerWithTitle.dart';

class MyDashboardScreenSkeleton extends StatefulWidget {
  @override
  _MyDashboardScreenSkeletonState createState() =>
      _MyDashboardScreenSkeletonState();
}

class _MyDashboardScreenSkeletonState extends State<MyDashboardScreenSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.015),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Center(
                    child: Image(image: AssetImage('images/appiconnoback.png')),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          width: MediaQuery.of(context).size.height * 0.22,
                          child: RiveAnimation.asset(
                            'assets/skeleton-place-holder.riv',
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),

                    /*Text(
                            name,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'young',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.035),
                          ),*/
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.035,
                            child: RiveAnimation.asset(
                              'assets/skeleton-place-holder.riv',
                              fit: BoxFit.cover,
                            ))),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.007,
                    ),
                    /*Text(
                      '@' + codername,
                      style: TextStyle(
                          color: ColorSchemeClass.lightgrey,
                          fontFamily: 'young',
                          fontSize: MediaQuery.of(context).size.height * 0.025),
                    ),*/
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.025,
                            child: RiveAnimation.asset(
                              'assets/skeleton-place-holder.riv',
                              fit: BoxFit.cover,
                            ))),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    MyMidDividerWithTitle('Bio'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    /*Text(
                      bio,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorSchemeClass.lightgrey,
                          fontFamily: 'young',
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    ),*/
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.02,
                            child: RiveAnimation.asset(
                              'assets/skeleton-place-holder.riv',
                              fit: BoxFit.cover,
                            ))),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    MyMidDividerWithTitle('Ratings'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.32,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Theme(
                        data: ThemeData(accentColor: Colors.transparent),
                        child: GridView.count(crossAxisCount: 2, children: [
                          Container(
                            child: Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.25,
                                      child: RiveAnimation.asset(
                                        'assets/skeleton-place-holder.riv',
                                        fit: BoxFit.cover,
                                      ))),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.25,
                                      child: RiveAnimation.asset(
                                        'assets/skeleton-place-holder.riv',
                                        fit: BoxFit.cover,
                                      ))),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.25,
                                      child: RiveAnimation.asset(
                                        'assets/skeleton-place-holder.riv',
                                        fit: BoxFit.cover,
                                      ))),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.25,
                                      child: RiveAnimation.asset(
                                        'assets/skeleton-place-holder.riv',
                                        fit: BoxFit.cover,
                                      ))),
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/* */