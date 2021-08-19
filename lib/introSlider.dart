import 'package:coderstatus/components/colorscheme.dart';
import 'package:flutter/material.dart';

import 'homeScreen.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({Key key}) : super(key: key);

  @override
  _IntroSliderState createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  final controller = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemeClass.primarygreen,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }), ModalRoute.withName('/home'));
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontFamily: 'young',
                            fontSize: MediaQuery.of(context).size.width * 0.05),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    currentPage == 0 ? OnDOt() : OffDot(),
                    currentPage == 1 ? OnDOt() : OffDot(),
                    currentPage == 2 ? OnDOt() : OffDot(),
                  ],
                )
              ],
            ),
          ),
          Flexible(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              controller: controller,
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'images/mockUpArt1.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'images/mockUpArt2.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'images/mockUpArt3.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnDOt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 0, horizontal: MediaQuery.of(context).size.width * 0.01),
      width: MediaQuery.of(context).size.width * 0.05,
      height: MediaQuery.of(context).size.height * 0.01,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(100)),
    );
  }
}

class OffDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 0, horizontal: MediaQuery.of(context).size.width * 0.01),
      width: MediaQuery.of(context).size.width * 0.025,
      height: MediaQuery.of(context).size.height * 0.01,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
