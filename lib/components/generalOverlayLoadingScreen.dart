import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/verifyEmailScreen.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class GeneralOverlayLoadingScreen extends StatelessWidget {
  String heading;

  GeneralOverlayLoadingScreen(String heading) {
    this.heading = heading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorschemeclass.dark.withOpacity(0.3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.height * 0.1,
                height: MediaQuery.of(context).size.height * 0.1,
                child: RiveAnimation.asset('assets/cup_animation.riv')),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              heading,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'young',
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            )
          ],
        ),
      ),
    );
  }
}
