import 'dart:async';

import 'package:coder_status/components/colorscheme.dart';
import 'package:coder_status/screens/registerAvatarScreen.dart';
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

class Registercodernamescreen extends StatefulWidget {
  Registercodernamescreen(String name) {
    _RegistercodernamescreenState.name = name;
  }

  @override
  _RegistercodernamescreenState createState() =>
      _RegistercodernamescreenState();
}

class _RegistercodernamescreenState extends State<Registercodernamescreen> {
  static String name = '';
  String codername = '';
  final _formkey = GlobalKey<FormState>();
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

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Registeravatarscreen(name, codername);
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
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Hero(
                      tag: 'appIcon',
                      child: Image(
                        width: MediaQuery.of(context).size.width * 0.45,
                        image: AssetImage('images/appiconnoback.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Flexible(
                      child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                    child: Text(
                      'Choose Codername',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.035,
                          fontFamily: 'young'),
                    ),
                  )),
                  Flexible(
                      child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                    child: Text(
                      'Codername is like a Username,\n*Example: @god_Kira',
                      style: TextStyle(
                          color: ColorSchemeClass.darkgrey,
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                          fontFamily: 'young'),
                      textAlign: TextAlign.center,
                    ),
                  )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  MyTextFormField(Icon(FontAwesomeIcons.at), 'codername', false,
                      (val) {
                    codername = val.toString().trim();
                  },
                      TextInputType.text,
                      (val) => (val.toString().trim().contains(' ') ||
                              val.toString().trim().length < 4)
                          ? 'Codername can only be consist a single word'
                          : null),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                        vertical: MediaQuery.of(context).size.height * 0.01),
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
