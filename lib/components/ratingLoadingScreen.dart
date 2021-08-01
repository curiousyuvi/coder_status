import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/verifyEmailScreen.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RatingsLoadingScreen extends StatelessWidget {
  String heading;

  RatingsLoadingScreen(String heading) {
    this.heading = heading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.height * 0.5,
                child: RiveAnimation.asset('assets/document_animation.riv')),
            Container(
              width: MediaQuery.of(context).size.height * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.335,
                      width: MediaQuery.of(context).size.height * 0.5,
                    ),
                    Text(
                      heading,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'young',
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
