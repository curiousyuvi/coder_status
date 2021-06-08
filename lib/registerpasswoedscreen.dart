import 'package:codersstatus/colorscheme.dart';
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
import 'mybadgesscreen.dart';

void main() => runApp(
      MaterialApp(
        home: registerpasswordscreen(),
      ),
    );

class registerpasswordscreen extends StatefulWidget {
  const registerpasswordscreen({Key key}) : super(key: key);

  @override
  _registerpasswordscreenState createState() => _registerpasswordscreenState();
}

class _registerpasswordscreenState extends State<registerpasswordscreen> {
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
                    width: 300,
                    image: AssetImage('images/appiconnoback.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Choose Password',
                  style: TextStyle(
                      color: Colors.white, fontSize: 25, fontFamily: 'young'),
                ),
              )),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Use a combination of letters, digits and special characters',
                  style: TextStyle(
                      color: colorschemeclass.darkgrey,
                      fontSize: 15,
                      fontFamily: 'young'),
                ),
              )),
              Flexible(child: myTextField(Icon(Icons.vpn_key), 'password')),
              Flexible(
                  child: myTextField(Icon(Icons.vpn_key), 'confirm password')),
              Flexible(
                  child: myButton(true, 'Next', () {
                print('Next pressed!!!');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return mybadgesscreen();
                }));
              }))
            ],
          ),
        ),
      ),
    );
  }
}
