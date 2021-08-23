import 'dart:async';

import 'package:coder_status/components/colorscheme.dart';
import 'package:coder_status/components/showAnimatedToast.dart';
import 'package:coder_status/firebase_layer/emailVerification.dart';
import 'package:coder_status/screens/signInEmailScreen.dart';
import 'package:coder_status/screens/verifyEmailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../components/generalLoader.dart';
import '../components/myTextFormFields.dart';
import '../components/myButtons.dart';
import 'package:coder_status/firebase_layer/createuser.dart';

import '../components/noInternet.dart';

void main() => runApp(
      MaterialApp(
        home: RegisterPasswordScreen('example@email'),
      ),
    );

class RegisterPasswordScreen extends StatefulWidget {
  RegisterPasswordScreen(String emailid) {
    _RegisterPasswordScreenState.emailid = emailid;
  }

  @override
  _RegisterPasswordScreenState createState() => _RegisterPasswordScreenState();
}

class _RegisterPasswordScreenState extends State<RegisterPasswordScreen> {
  static String emailid = '';
  String password = '';
  bool isloading = false;
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

  final _formkey = GlobalKey<FormState>();

  void _submit() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      setState(() {
        isloading = true;
      });

      createAccount(emailid, password).then((user) {
        if (user != null) {
          sendVerificationEmail(emailid);
          showAnimatedToast(
              this.context, 'Verification mail sent to your Email', true);

          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return VerifyEmailScreen();
          }), ModalRoute.withName('/emailVerify'));
        } else {
          setState(() {
            isloading = false;
          });
          showAnimatedToast(
              this.context, 'Email already exists, head to sign in', false);
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return SignInEmailScreen();
          }), ModalRoute.withName('/signin'));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? Scaffold(
            body: GeneralLoader(''),
          )
        : GestureDetector(
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
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MediaQuery.of(context).viewInsets.bottom == 0
                            ? Flexible(
                                child: Hero(
                                  tag: 'appIcon',
                                  child: Image(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    image:
                                        AssetImage('images/appiconnoback.png'),
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        MediaQuery.of(context).viewInsets.bottom == 0
                            ? Flexible(
                                child: Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width * 0.02),
                                child: Text(
                                  'Choose Password',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.035,
                                      fontFamily: 'young'),
                                ),
                              ))
                            : SizedBox.shrink(),
                        Flexible(
                            child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.02),
                          child: Text(
                              'Use a combination of letters, digits and special characters',
                              style: TextStyle(
                                  color: ColorSchemeClass.darkgrey,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontFamily: 'young'),
                              textAlign: TextAlign.center),
                        )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        MyTextFormField(
                            Icon(FontAwesomeIcons.key), 'password', true,
                            (val) {
                          setState(() {
                            password = val;
                          });
                        },
                            TextInputType.visiblePassword,
                            (val) => val.trim().length < 6
                                ? 'Password must contain atleast 6 characters'
                                : null),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        MyTextFormField(
                            Icon(FontAwesomeIcons.key),
                            'confirm password',
                            true,
                            (val) {},
                            TextInputType.visiblePassword,
                            (val) => val != password
                                ? 'Password doesn\'t match'
                                : null),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01),
                          height: MediaQuery.of(context).size.height * 0.09,
                          child: MyButton(
                              ColorSchemeClass.primarygreen, 'Next', _submit),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
