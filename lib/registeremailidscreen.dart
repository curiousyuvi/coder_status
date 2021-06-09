import 'package:codersstatus/colorscheme.dart';
import 'package:codersstatus/registernamescreen.dart';
import 'package:codersstatus/registerpasswoedscreen.dart';
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
        home: registeremailidscreen(),
      ),
    );

class registeremailidscreen extends StatefulWidget {
  const registeremailidscreen({Key key}) : super(key: key);

  @override
  _registeremailidscreenState createState() => _registeremailidscreenState();
}

class _registeremailidscreenState extends State<registeremailidscreen> {
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
                  'Enter Email Id',
                  style: TextStyle(
                      color: Colors.white, fontSize: 25, fontFamily: 'young'),
                ),
              )),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Please enter a valid Email Id because a verification code will be sent to your Email',
                    style: TextStyle(
                        color: colorschemeclass.darkgrey,
                        fontSize: 15,
                        fontFamily: 'young'),
                    textAlign: TextAlign.center),
              )),
              Flexible(child: myTextField(Icon(Icons.email_sharp), 'email id')),
              Flexible(
                  child: myButton(false, 'Send Confirmation Code', () {
                print('OTP sent!!!');
              })),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Enter the confirmation code you receive on your email',
                    style: TextStyle(
                        color: colorschemeclass.darkgrey,
                        fontSize: 15,
                        fontFamily: 'young'),
                    textAlign: TextAlign.center),
              )),
              Flexible(
                  child: myTextField(Icon(Icons.check), 'confirmation code')),
              Flexible(
                  child: myButton(true, 'Next', () {
                print('Next pressed!!!');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return registerpasswordscreen();
                }));
              }))
            ],
          ),
        ),
      ),
    );
  }
}
