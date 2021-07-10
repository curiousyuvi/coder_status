import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/registeremailidscreen2.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class GeneralLoadingScreen extends StatelessWidget {
  String heading;

  GeneralLoadingScreen(String heading) {
    this.heading = heading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.height * 0.2,
                height: MediaQuery.of(context).size.height * 0.2,
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
