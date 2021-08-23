import 'package:coder_status/components/colorscheme.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class GeneralLoader extends StatelessWidget {
  String heading;

  GeneralLoader(String heading) {
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
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.3,
                child: Hero(
                    tag: 'cup', child: RiveAnimation.asset('assets/cup.riv'))),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              heading,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'young',
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            )
          ],
        ),
      ),
    );
  }
}

class GeneralLoaderTransparent extends StatelessWidget {
  String heading;

  GeneralLoaderTransparent(String heading) {
    this.heading = heading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemeClass.dark.withOpacity(0.5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.3,
                child: RiveAnimation.asset('assets/cup.riv')),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              heading,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'young',
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            )
          ],
        ),
      ),
    );
  }
}
