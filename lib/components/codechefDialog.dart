import 'package:coder_status/components/colorscheme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

showCodechefDialog(BuildContext context, Rect? rect, String codechefHandle,
    String codechefRating) {
  int codechefStarCount = 1;
  int rating = int.parse(codechefRating);
  if (rating <= 1399) {
    codechefStarCount = 1;
  } else if (rating <= 1599) {
    codechefStarCount = 2;
  } else if (rating <= 1799) {
    codechefStarCount = 3;
  } else if (rating <= 1999) {
    codechefStarCount = 4;
  } else if (rating <= 2199) {
    codechefStarCount = 5;
  } else if (rating <= 2499) {
    codechefStarCount = 6;
  } else if (rating >= 2500) {
    codechefStarCount = 7;
  }

  List<Icon> listOfStars = [];
  for (int i = 1; i <= codechefStarCount; i++) {
    listOfStars.add(Icon(
      FontAwesomeIcons.solidStar,
      size: MediaQuery.of(context).size.width * 0.035,
      color: ColorSchemeClass.codechefbrown,
    ));
  }
  OverlayState? overlayState = Overlay.of(context);
  OverlayEntry? overlayEntry;
  overlayEntry = OverlayEntry(builder: (context) {
    return GestureDetector(
      onTap: () {
        overlayEntry!.remove();
      },
      child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.transparent,
          child: Column(
            children: [
              SizedBox(
                height: rect!.top - MediaQuery.of(context).size.height * 0.13,
              ),
              Row(
                children: [
                  SizedBox(
                    width:
                        rect.left - MediaQuery.of(context).size.width * 0.034,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        GlassContainer(
                          blur: 3,
                          width: MediaQuery.of(context).size.width * 0.42,
                          height: MediaQuery.of(context).size.height * 0.1265,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.42,
                          height: MediaQuery.of(context).size.height * 0.157,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage('images/dialogCodechef.png'))),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.02,
                                MediaQuery.of(context).size.width * 0.025,
                                MediaQuery.of(context).size.width * 0.02,
                                MediaQuery.of(context).size.height * 0.04),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: FittedBox(
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
                                          'CODECHEF',
                                          style: TextStyle(
                                              color: ColorSchemeClass
                                                  .codechefbrown,
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
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Flexible(
                                  child: FittedBox(
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
                                          '@' + codechefHandle,
                                          style: TextStyle(
                                              color: ColorSchemeClass
                                                  .codechefbrown,
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
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Flexible(
                                  child: Row(
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
                                        codechefRating,
                                        style: TextStyle(
                                            color:
                                                ColorSchemeClass.codechefbrown,
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
                                                ColorSchemeClass.codechefbrown,
                                            fontFamily: 'young',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.015,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Text(
                                        'Stars : ',
                                        style: TextStyle(
                                            color: ColorSchemeClass.lightgrey,
                                            fontFamily: 'young',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Row(
                                          children: listOfStars,
                                        ),
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

  overlayState!.insert(overlayEntry);
}
