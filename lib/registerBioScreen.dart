import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myOutlineButton.dart';
import 'package:codersstatus/components/myPassageTextformField.dart';
import 'package:codersstatus/registerBadgesScreen.dart';
import 'package:codersstatus/registerCodernameScreen.dart';
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
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Registerbadgesscreen(name, codername, avatarurl, bio);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorschemeclass.dark,
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
                    tag: 'splashscreenImage',
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
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
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
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  child: Text(
                    '*Example: Hey there, I love Competitive Programming',
                    style: TextStyle(
                        color: colorschemeclass.darkgrey,
                        fontSize: MediaQuery.of(context).size.height * 0.021,
                        fontFamily: 'young'),
                    textAlign: TextAlign.center,
                  ),
                )),
                myPassageTextEormField('Bio', (val) {
                  bio = val.toString().trim();
                },
                    (val) => val.toString().trim().length > 100
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
                          child: myOutlineButton(
                              colorschemeclass.lightgrey, 'Skip', () {
                            bio = 'Hey there, I love Competitive Programming';
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Registerbadgesscreen(
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
                          child: myButton(
                              colorschemeclass.primarygreen, 'Next', _submit)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
