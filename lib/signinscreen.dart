import 'package:codersstatus/colorscheme.dart';
import 'package:codersstatus/mybadgesscreen.dart';
import 'package:codersstatus/registernamescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'myTextField.dart';
import 'coderstatusheading.dart';
import 'myButton.dart';

void main() =>
    runApp(
      MaterialApp(
        home: signinscreen(),
      ),
    );

class signinscreen extends StatefulWidget {
  const signinscreen({Key key}) : super(key: key);

  @override
  _signinscreenState createState() => _signinscreenState();
}

class _signinscreenState extends State<signinscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorschemeclass.dark,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Hero(
                  tag: 'splashscreenImage',
                  child: Image(
                    image: AssetImage('images/appiconnoback.png'),
                  ),
                ),
              ),
              Flexible(
                child: coderstatusheading(),
              ),
              SizedBox(
                height: 50,
              ),
              Flexible(child: myTextField(Icon(Icons.email), 'Email Id')),
              Flexible(child: myTextField(Icon(Icons.vpn_key), 'Password')),
              Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: myButton(true, 'Log in', () {
                          print('login pressed!!!');
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return mybadgesscreen();
                              }));
                        }),
                      ),
                      Flexible(
                        child: myButton(false, 'Register', () { Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return registernamescreen();
                            }));}),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
