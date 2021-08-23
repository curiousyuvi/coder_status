import 'dart:async';

import 'package:coder_status/components/colorscheme.dart';
import 'package:coder_status/components/generalLoader.dart';
import 'package:coder_status/screens/signInEmailScreen.dart';
import 'package:coder_status/screens/registerPasswordScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../components/myTextFormFields.dart';
import '../components/myButtons.dart';
import '../components/noInternet.dart';

class RegisterEmailidScreen extends StatefulWidget {
  @override
  _RegisterEmailidScreenState createState() => _RegisterEmailidScreenState();
}

class _RegisterEmailidScreenState extends State<RegisterEmailidScreen> {
  String emailid = '';
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
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

  void _submit() async {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return RegisterPasswordScreen(emailid);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
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
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
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
                                      MediaQuery.of(context).size.width * 0.4,
                                  image: AssetImage('images/appiconnoback.png'),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      MediaQuery.of(context).viewInsets.bottom == 0
                          ? Flexible(
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'headline',
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.06),
                                    children: [
                                      TextSpan(
                                        text: 'CODER',
                                      ),
                                      TextSpan(
                                          text: ' STATUS',
                                          style: TextStyle(
                                              color: ColorSchemeClass
                                                  .primarygreen))
                                    ]),
                              ),
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Flexible(
                          child: Text(
                        'Enter Your Email Id',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontFamily: 'young'),
                      )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Flexible(
                          child: Text(
                              'A verification link will be sent to your given Email',
                              style: TextStyle(
                                  color: ColorSchemeClass.darkgrey,
                                  fontSize: 15,
                                  fontFamily: 'young'),
                              textAlign: TextAlign.center)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      MyTextFormField(Icon(FontAwesomeIcons.solidEnvelope),
                          'email id', false, (val) {
                        emailid = val;
                      },
                          TextInputType.emailAddress,
                          (val) => !val.contains('@')
                              ? 'Please enter a valid email'
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignInEmailScreen();
                            }));
                          },
                          child: Text(
                            'Already have an account? Log in',
                            style: TextStyle(
                                color: ColorSchemeClass.lightgrey,
                                fontFamily: 'young',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                decoration: TextDecoration.underline),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        isLoading ? GeneralLoaderTransparent('') : SizedBox.shrink()
      ],
    );
  }
}
