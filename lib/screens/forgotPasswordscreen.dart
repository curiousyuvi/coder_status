import 'dart:async';

import 'package:CoderStatus/components/colorscheme.dart';
import 'package:CoderStatus/components/showAnimatedToast.dart';
import 'package:CoderStatus/firebase_layer/resetPassword.dart';
import 'package:CoderStatus/screens/signInEmailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../components/myTextFormFields.dart';
import '../components/myButtons.dart';
import '../components/noInternet.dart';

void main() => runApp(
      MaterialApp(
        home: Forgotpasswordscreen(),
      ),
    );

class Forgotpasswordscreen extends StatefulWidget {
  const Forgotpasswordscreen({Key key}) : super(key: key);

  @override
  _ForgotpasswordscreenState createState() => _ForgotpasswordscreenState();
}

class _ForgotpasswordscreenState extends State<Forgotpasswordscreen> {
  //Form State

  final _formkey = GlobalKey<FormState>();
  String emailid = '';
  StreamSubscription subscription;

  @override
  Future<void> initState() {
    super.initState();

    subscription = InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;

      if (!hasInternet) NoInternet(this.context);
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void _submit() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

      resetpassword(emailid);

      showAnimatedToast(this.context,
          'A paaswod reset link was succesfully sent to your email.', true);

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SignInEmailScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: ColorSchemeClass.dark,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formkey,
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
                  SizedBox(
                    height: 50,
                  ),
                  Flexible(
                      child: Text(
                    'Enter Email Id',
                    style: TextStyle(
                        color: Colors.white, fontSize: 25, fontFamily: 'young'),
                  )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Flexible(
                      child: Text(
                          'A passowrd reset link will be sent to your given Email',
                          style: TextStyle(
                              color: ColorSchemeClass.darkgrey,
                              fontSize: 15,
                              fontFamily: 'young'),
                          textAlign: TextAlign.center)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  MyTextFormField(Icon(Icons.email), 'Email Id', false, (val) {
                    emailid = val;
                  },
                      TextInputType.emailAddress,
                      (val) => !val.contains('@')
                          ? 'Please enter a valid email'
                          : null),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  MyButton(
                      ColorSchemeClass.primarygreen, 'Send Request', _submit),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
