import 'dart:async';
import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myOutlineButton.dart';
import 'package:codersstatus/firebase_layer/emailVerification.dart';
import 'package:codersstatus/firebase_layer/getUserInfo.dart';
import 'package:codersstatus/registerAvatarScreen.dart';
import 'package:codersstatus/registerNameScreen.dart';
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
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Registernamescreen();
        }));
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
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                  padding: EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height * 0.085,
                  child: MyOutlineButton(ColorSchemeClass.darkgrey,
                      'Resend Verification email', _submit))
            ],
          ),
        ),
      ),
    );
  }
}
