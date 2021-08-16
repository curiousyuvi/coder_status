import 'package:coderstatus/components/colorscheme.dart';
import 'package:coderstatus/components/myOutlineButton.dart';
import 'package:coderstatus/components/myPassageTextformField.dart';
import 'package:coderstatus/registerUserHandleScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'components/myButton.dart';

void main() => runApp(
      MaterialApp(
        home:
            Registerbioscreen('Yuvraj Singh', '@curiousyuvi', 'kjfdnndfndfvjv'),
      ),
    );

class Registerbioscreen extends StatefulWidget {
  Registerbioscreen(String name, String codername, String avatarurl) {
    _RegisterbioscreenState.name = name;
    _RegisterbioscreenState.codername = codername;
    _RegisterbioscreenState.avatarurl = avatarurl;
  }

  @override
  _RegisterbioscreenState createState() => _RegisterbioscreenState();
}

class _RegisterbioscreenState extends State<Registerbioscreen> {
  static String name = '';
  static String codername = '';
  static String avatarurl = '';
  static String bio = '';
  final _formkey = GlobalKey<FormState>();

  void _submit() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return RegisterUserHandleScreen(name, codername, avatarurl, bio);
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
                      'Write a small Bio about you',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.033,
                          fontFamily: 'young'),
                    ),
                  )),
                  Flexible(
                      child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                    child: Text(
                      '*Example: Hey there, I love Competitive Programming',
                      style: TextStyle(
                          color: ColorSchemeClass.darkgrey,
                          fontSize: MediaQuery.of(context).size.height * 0.021,
                          fontFamily: 'young'),
                      textAlign: TextAlign.center,
                    ),
                  )),
                  MyPassageTextEormField('Bio', (val) {
                    bio = val.toString().trim();
                  },
                      (val) => val.toString().trim().length > 100 ||
                              val.toString().trim().length == 0
                          ? 'Bio should be under 100 characters'
                          : null),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.022),
                            height: MediaQuery.of(context).size.height * 0.12,
                            child: MyOutlineButton(
                                ColorSchemeClass.lightgrey, 'Skip', () {
                              bio = 'Hey there, I love Competitive Programming';
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegisterUserHandleScreen(
                                    name, codername, avatarurl, bio);
                              }));
                            })),
                      ),
                      Flexible(
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.022),
                            height: MediaQuery.of(context).size.height * 0.115,
                            child: MyButton(ColorSchemeClass.primarygreen,
                                'Next', _submit)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
