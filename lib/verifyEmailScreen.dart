import 'dart:async';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:coderstatus/components/colorscheme.dart';
import 'package:coderstatus/firebase_layer/emailVerification.dart';
import 'package:coderstatus/firebase_layer/getUserInfo.dart';
import 'package:coderstatus/registerNameScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: VerifyEmailScreen(),
  ));
}

class VerifyEmailScreen extends StatefulWidget {
  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  Timer timer;

  void _submit() async {
    await sendVerificationEmail(GetUserInfo.getUserEmail());
  }

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 3), (timer) async {
      final flag = await checkEmailVerified();
      if (flag) {
        timer.cancel();
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return Registernamescreen();
        }), ModalRoute.withName('/registerName'));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemeClass.dark,
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
              Flexible(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
              ),
              Flexible(
                  child: Text('Check your inbox for the verification Email',
                      style: TextStyle(
                          color: ColorSchemeClass.lightgrey,
                          fontSize: MediaQuery.of(context).size.height * 0.028,
                          fontFamily: 'young'),
                      textAlign: TextAlign.center)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              CircularProgressIndicator(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Flexible(
                  child: Text('Waiting for email to be verified',
                      style: TextStyle(
                          color: ColorSchemeClass.darkgrey,
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                          fontFamily: 'young'),
                      textAlign: TextAlign.center)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              ArgonTimerButton(
                initialTimer: 90, // Optional
                height: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                minWidth: MediaQuery.of(context).size.width * 0.7,
                color: Colors.transparent,
                borderSide:
                    BorderSide(color: ColorSchemeClass.lightgrey, width: 2),
                borderRadius: 5.0,
                child: Text(
                  'Resend Verification Email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorSchemeClass.lightgrey,
                      fontFamily: 'young',
                      fontSize: MediaQuery.of(context).size.height * 0.025),
                ),
                loader: (timeLeft) {
                  return Text(
                    "Resend Verification Email | $timeLeft",
                    style: TextStyle(
                      color: ColorSchemeClass.lightgrey,
                      fontFamily: 'young',
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                    ),
                  );
                },
                onTap: (startTimer, btnState) {
                  if (btnState == ButtonState.Idle) {
                    startTimer(90);
                    _submit();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
