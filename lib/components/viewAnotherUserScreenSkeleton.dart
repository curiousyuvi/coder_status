import 'package:codersstatus/components/myDividerWithTitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

import 'myAppBar.dart';

class ViewAnotherUserScreenSkeleton extends StatefulWidget {
  @override
  _ViewAnotherUserScreenSkeletonState createState() =>
      _ViewAnotherUserScreenSkeletonState();
}

class _ViewAnotherUserScreenSkeletonState
    extends State<ViewAnotherUserScreenSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: MyAppBarWithBack('User'),
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.02),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: RiveAnimation.asset(
                                    'assets/skeleton-place-holder.riv')),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    child: RiveAnimation.asset(
                                      'assets/skeleton-place-holder.riv',
                                      fit: BoxFit.cover,
                                    ))),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.007,
                            ),
                            /* FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '@' + codername,
                                style: TextStyle(
                                    color: ColorSchemeClass.lightgrey,
                                    fontFamily: 'young',
                                    fontSize: MediaQuery.of(context).size.height *
                                        0.02),
                              ),
                            ),*/
                            ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                    child: RiveAnimation.asset(
                                      'assets/skeleton-place-holder.riv',
                                      fit: BoxFit.cover,
                                    ))),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    /*MyButton(ColorSchemeClass.primarygreen,
                                    'Add as a Peer', () {
                                    addInPeers();
                                  }, Icons.add_circle),*/
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: RiveAnimation.asset(
                                'assets/skeleton-place-holder.riv',
                                fit: BoxFit.cover,
                              ))),
                    ),
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
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
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
                      height: MediaQuery.of(context).size.height * 0.02,
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
