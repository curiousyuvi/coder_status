import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  String heading;

  LoadingScreen([String heading = 'Loading...']) {
    this.heading = heading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('images/cat_gif.gif')),
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
