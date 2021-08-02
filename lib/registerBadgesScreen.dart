import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/generalLoadingScreen.dart';
import 'package:codersstatus/components/showAnimatedToast.dart';
import 'package:codersstatus/components/ratingLoadingScreen.dart';
import 'package:codersstatus/components/myButton.dart';
import 'package:codersstatus/components/myTextFormField.dart';
import 'package:codersstatus/firebase_layer/setUserInfo.dart';
import 'package:codersstatus/homescreen.dart';
import 'package:flutter/material.dart';

class Registerbadgesscreen extends StatefulWidget {
  Registerbadgesscreen(
      String name, String codername, String avatarurl, String bio) {
    _RegisterbadgesscreenState.name = name;
    _RegisterbadgesscreenState.codername = codername;
    _RegisterbadgesscreenState.avatarurl = avatarurl;
    _RegisterbadgesscreenState.bio = bio;
  }

  @override
  _RegisterbadgesscreenState createState() => _RegisterbadgesscreenState();
}

class _RegisterbadgesscreenState extends State<Registerbadgesscreen> {
  static String name = '';
  static String codername = '';
  static String avatarurl = '';
  static String bio = '';

  String codeforces = null, codechef = null, atcoder = null, spoj = null;
  final _formkey = GlobalKey<FormState>();
  bool isloading = false;

  void _submit() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      setState(() {
        isloading = true;
      });

      await SetUserInfo.setUserCredentials(
          name, codername, avatarurl, bio, codeforces, codechef, spoj, atcoder);
      setState(() {
        isloading = false;
      });

      showAnimatedToast(this.context, 'Account Created Succesfully.', true);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }), ModalRoute.withName('/home'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? GeneralLoadingScreen('Creating Account...')
        : Scaffold(
            backgroundColor: colorschemeclass.dark,
            body: SafeArea(
                child: Container(
              width: double.infinity,
              height: double.infinity,
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.015),
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Image(
                        image: AssetImage('images/appiconnoback.png'),
                        height: MediaQuery.of(context).size.height * 0.12,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Add Your User Handles',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'young',
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.045),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        '*If you are not on a particular platform you can leave that field empty.',
                        style: TextStyle(
                            color: colorschemeclass.lightgrey,
                            fontFamily: 'young',
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Row(
                            children: [
                              Image(
                                  image:
                                      AssetImage('images/codeforcesnobc.png')),
                              Flexible(
                                child: myTextEormField(
                                    Icon(Icons.alternate_email),
                                    'codeforces_handle',
                                    false, (val) {
                                  codeforces = val;
                                },
                                    TextInputType.name,
                                    (val) => val.trim().toString().contains(' ')
                                        ? 'User handle should\'nt contain spaces'
                                        : null),
                              )
                            ],
                          )),
                      Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Row(
                            children: [
                              Image(
                                  image: AssetImage('images/codechefnobc.png')),
                              Flexible(
                                child: myTextEormField(
                                    Icon(Icons.alternate_email),
                                    'codechef_handle',
                                    false, (val) {
                                  codechef = val;
                                },
                                    TextInputType.name,
                                    (val) => val.trim().toString().contains(' ')
                                        ? 'User handle should\'nt contain spaces'
                                        : null),
                              )
                            ],
                          )),
                      Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Row(
                            children: [
                              Image(
                                  image: AssetImage('images/atcodernobc.png')),
                              Flexible(
                                child: myTextEormField(
                                    Icon(Icons.alternate_email),
                                    'atcoder_handle',
                                    false, (val) {
                                  atcoder = val;
                                },
                                    TextInputType.name,
                                    (val) => val.trim().toString().contains(' ')
                                        ? 'User handle should\'nt contain spaces'
                                        : null),
                              )
                            ],
                          )),
                      Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Row(
                            children: [
                              Image(image: AssetImage('images/spojnobc.png')),
                              Flexible(
                                child: myTextEormField(
                                    Icon(Icons.alternate_email),
                                    'spoj_handle',
                                    false, (val) {
                                  spoj = val;
                                },
                                    TextInputType.name,
                                    (val) => val.trim().toString().contains(' ')
                                        ? 'User handle should\'nt contain spaces'
                                        : null),
                              )
                            ],
                          )),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02,
                            vertical:
                                MediaQuery.of(context).size.height * 0.01),
                        height: MediaQuery.of(context).size.height * 0.09,
                        child: myButton(colorschemeclass.primarygreen,
                            'Create Account', _submit),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
