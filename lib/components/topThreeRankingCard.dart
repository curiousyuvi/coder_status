import 'package:coder_status/components/myCircleAvatar.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'colorscheme.dart';

class TopThreeRankingCard extends StatelessWidget {
  String avatarurl1 = '',
      avatarurl2 = '',
      avatarurl3 = '',
      userhandle1 = '',
      userhandle2 = '',
      userhandle3 = '',
      userRating1 = '',
      userRating2 = '',
      userRating3 = '';
  TopThreeRankingCard(
      this.avatarurl1,
      this.avatarurl2,
      this.avatarurl3,
      this.userhandle1,
      this.userhandle2,
      this.userhandle3,
      this.userRating1,
      this.userRating2,
      this.userRating3);

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
                        Flexible(
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: ColorSchemeClass.lightgrey,
                            size: MediaQuery.of(context).size.height * 0.032,
                          ),
                        ),
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '2',
                              style: TextStyle(
                                  color: ColorSchemeClass.lightgrey,
                                  fontFamily: 'young',
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.032),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Container(
                            height: MediaQuery.of(context).size.width * 0.3,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: MyCircleAvatar(Image.network(avatarurl2))),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Flexible(
                          child: Container(
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
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              userRating2 + ' pts',
                              style: TextStyle(
                                  color: ColorSchemeClass.primarygreen,
                                  fontFamily: 'young',
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.04),
                            ),
                          ),
                        )
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
                          Flexible(
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: ColorSchemeClass.lightgrey,
                              size: MediaQuery.of(context).size.height * 0.032,
                            ),
                          ),
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '3',
                                style: TextStyle(
                                    color: ColorSchemeClass.lightgrey,
                                    fontFamily: 'young',
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.032),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Container(
                              height: MediaQuery.of(context).size.width * 0.3,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: MyCircleAvatar(Image.network(avatarurl3))),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Flexible(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    '@' + userhandle3,
                                    style: TextStyle(
                                        color: ColorSchemeClass.lightgrey,
                                        fontFamily: 'young',
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.03),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Flexible(
                            child: FittedBox(
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
                            ),
                          )
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
                  Flexible(
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: ColorSchemeClass.lightgrey,
                      size: MediaQuery.of(context).size.height * 0.032,
                    ),
                  ),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '1',
                        style: TextStyle(
                            color: ColorSchemeClass.lightgrey,
                            fontFamily: 'young',
                            fontSize:
                                MediaQuery.of(context).size.height * 0.032),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.height * 0.05,
                      child: RiveAnimation.asset('assets/crown.riv'),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      height: MediaQuery.of(context).size.width * 0.4,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: MyCircleAvatar(Image.network(avatarurl1))),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '@' + userhandle1,
                          style: TextStyle(
                              color: ColorSchemeClass.lightgrey,
                              fontFamily: 'young',
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        userRating1 + ' pts',
                        style: TextStyle(
                            color: ColorSchemeClass.primarygreen,
                            fontFamily: 'young',
                            fontSize:
                                MediaQuery.of(context).size.height * 0.04),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
