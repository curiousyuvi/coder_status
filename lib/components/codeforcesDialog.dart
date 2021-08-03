import 'package:codersstatus/components/colorscheme.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

showCodeforcesDialog(BuildContext context, Rect rect, String codeforcesHandle,
    String codeforcesRating) {
  String codeforcesTitle = '';
  int rating = int.parse(codeforcesRating);
  if (rating <= 1199) {
    codeforcesTitle = 'NEWBIE';
  } else if (rating <= 1399) {
    codeforcesTitle = 'PUPIL';
  } else if (rating <= 1599) {
    codeforcesTitle = 'SPECIALIST';
  } else if (rating <= 1899) {
    codeforcesTitle = 'EXPERT';
  } else if (rating <= 2099) {
    codeforcesTitle = 'CANDIDATE MASTER';
  } else if (rating <= 2299) {
    codeforcesTitle = 'MASTER';
  } else if (rating <= 2399) {
    codeforcesTitle = 'INTERNATIONAL MASTER';
  } else if (rating <= 2599) {
    codeforcesTitle = 'GRANDMASTER';
  } else if (rating <= 2999) {
    codeforcesTitle = 'INTERNATIONAL GRANDMASTER';
  } else if (rating >= 3000) {
    codeforcesTitle = 'LEGENDARY GRANDMASTER';
  }
  OverlayState overlayState = Overlay.of(context);
  OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(builder: (context) {
    return GestureDetector(
      onTap: () {
        overlayEntry.remove();
      },
      child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.transparent,
          child: Column(
            children: [
              SizedBox(
                height: rect.top - MediaQuery.of(context).size.height * 0.14,
              ),
              Row(
                children: [
                  SizedBox(
                    width:
                        rect.left - MediaQuery.of(context).size.width * 0.045,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        GlassContainer(
                          width: MediaQuery.of(context).size.width * 0.38,
                          height: MediaQuery.of(context).size.height * 0.1265,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.38,
                          height: MediaQuery.of(context).size.height * 0.157,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'images/dialogCodeforces.png'))),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.02,
                                MediaQuery.of(context).size.width * 0.025,
                                MediaQuery.of(context).size.width * 0.02,
                                MediaQuery.of(context).size.height * 0.04),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Platform : ',
                                        style: TextStyle(
                                            color: ColorSchemeClass.lightgrey,
                                            fontFamily: 'young',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018),
                                      ),
                                      Text(
                                        'CODEFORCES',
                                        style: TextStyle(
                                            color: ColorSchemeClass
                                                .codeforcespurple,
                                            fontFamily: 'young',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Username : ',
                                        style: TextStyle(
                                            color: ColorSchemeClass.lightgrey,
                                            fontFamily: 'young',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018),
                                      ),
                                      Text(
                                        '@' + codeforcesHandle,
                                        style: TextStyle(
                                            color: ColorSchemeClass
                                                .codeforcespurple,
                                            fontFamily: 'young',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    Text(
                                      'Rating : ',
                                      style: TextStyle(
                                          color: ColorSchemeClass.lightgrey,
                                          fontFamily: 'young',
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.018),
                                    ),
                                    Text(
                                      codeforcesRating,
                                      style: TextStyle(
                                          color:
                                              ColorSchemeClass.codeforcespurple,
                                          fontFamily: 'young',
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ' pts',
                                      style: TextStyle(
                                          color:
                                              ColorSchemeClass.codeforcespurple,
                                          fontFamily: 'young',
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.015,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Title : ',
                                        style: TextStyle(
                                            color: ColorSchemeClass.lightgrey,
                                            fontFamily: 'young',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018),
                                      ),
                                      Text(
                                        codeforcesTitle,
                                        style: TextStyle(
                                            color: ColorSchemeClass
                                                .codeforcespurple,
                                            fontFamily: 'young',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  });

  overlayState.insert(overlayEntry);
}
