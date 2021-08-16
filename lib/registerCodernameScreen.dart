import 'package:coderstatus/components/colorscheme.dart';
import 'package:coderstatus/registerAvatarScreen.dart';
import 'package:coderstatus/registerBioScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/myTextFormField.dart';
import 'components/myButton.dart';

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

  void _submit() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      if (FirebaseAuth.instance.currentUser.photoURL == null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Registeravatarscreen(name, codername);
        }));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Registerbioscreen(
              name, codername, FirebaseAuth.instance.currentUser.photoURL);
        }));
      }
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
                  MyTextEormField(Icon(FontAwesomeIcons.at), 'codername', false,
                      (val) {
                    codername = val.toString().trim();
                  },
                      TextInputType.text,
                      (val) => (val.toString().trim().contains(' ') ||
                              val.toString().trim().length < 4)
                          ? 'Codername can only be consist a single word'
                          : null),
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
