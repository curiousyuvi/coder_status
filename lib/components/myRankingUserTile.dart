import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'colorscheme.dart';

//ignore: must_be_immutable
class MyRankingUserTile extends StatelessWidget {
  String avatarUrl, userHandle, rating;
  int rank;
  MyRankingUserTile(this.avatarUrl, this.userHandle, this.rating, this.rank);

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
                child: rank == 1
                    ? Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.06,
                              height: MediaQuery.of(context).size.width * 0.06,
                              child: RiveAnimation.asset('assets/crown.riv')),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.025,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                rank.toString(),
                                style: TextStyle(
                                    color: ColorSchemeClass.lightgrey,
                                    fontFamily: 'young',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
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
                                        MediaQuery.of(context).size.width *
                                            0.06),
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
                  CircleAvatar(
                    backgroundImage: NetworkImage(avatarUrl),
                    radius: MediaQuery.of(context).size.height * 0.04,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.24,
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '@' + userHandle,
                            style: TextStyle(
                                color: ColorSchemeClass.lightgrey,
                                fontFamily: 'young',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            rating + ' pts',
                            style: TextStyle(
                                color: ColorSchemeClass.primarygreen,
                                fontFamily: 'young',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03),
                          ),
                        ),
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
