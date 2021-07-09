import 'package:codersstatus/registeremailidscreen2.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  AssetImage mainimage;
  String heading;

  LoadingScreen(AssetImage mainimage, String heading) {
    this.mainimage = mainimage;
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
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image(image: mainimage)),
            Text(
              heading,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'young',
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
