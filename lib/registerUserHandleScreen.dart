import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/generalLoader.dart';
import 'package:codersstatus/components/showAnimatedToast.dart';
import 'package:codersstatus/components/myButton.dart';
import 'package:codersstatus/components/myTextFormField.dart';
import 'package:codersstatus/firebase_layer/setUserInfo.dart';
import 'package:codersstatus/introSlider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterUserHandleScreen extends StatefulWidget {
  RegisterUserHandleScreen(
      String name, String codername, String avatarurl, String bio) {
    _RegisterUserHandleScreenState.name = name;
    _RegisterUserHandleScreenState.codername = codername;
    _RegisterUserHandleScreenState.avatarurl = avatarurl;
    _RegisterUserHandleScreenState.bio = bio;
  }

  @override
  _RegisterUserHandleScreenState createState() =>
      _RegisterUserHandleScreenState();
}

class _RegisterUserHandleScreenState extends State<RegisterUserHandleScreen> {
  static String name = '';
  static String codername = '';
  static String avatarurl = '';
  static String bio = '';

  String codeforces = '', codechef = '', atcoder = '', spoj = '';
  final _formkey = GlobalKey<FormState>();
  bool isloading = false;

  void _submit() async {
    FocusScopeNode currentFocus = FocusScope.of(context);
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
        return IntroSlider();
      }), ModalRoute.withName('/introSlider'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? GeneralLoader('Creating Account...')
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
                          Hero(
                            tag: 'appIcon',
                            child: Image(
                              image: AssetImage('images/appiconnoback.png'),
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            'Add Your User Handles',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'young',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.045),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            '*If you are not on a particular platform you can leave that field empty.',
                            style: TextStyle(
                                color: ColorSchemeClass.lightgrey,
                                fontFamily: 'young',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Row(
                                children: [
                                  Image(
                                      image: AssetImage(
                                          'images/codeforceswhitelogo.png'),
                                      width: MediaQuery.of(context).size.width *
                                          0.15),
                                  Flexible(
                                    child: MyTextEormField(
                                        Icon(FontAwesomeIcons.at),
                                        'codeforces_handle',
                                        false, (val) {
                                      codeforces = val;
                                    },
                                        TextInputType.name,
                                        (val) => val
                                                .trim()
                                                .toString()
                                                .contains(' ')
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
                                      image: AssetImage(
                                          'images/codechefwhitelogo.png'),
                                      width: MediaQuery.of(context).size.width *
                                          0.15),
                                  Flexible(
                                    child: MyTextEormField(
                                        Icon(FontAwesomeIcons.at),
                                        'codechef_handle',
                                        false, (val) {
                                      codechef = val;
                                    },
                                        TextInputType.name,
                                        (val) => val
                                                .trim()
                                                .toString()
                                                .contains(' ')
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
                                      image: AssetImage(
                                          'images/atcoderwhitelogo.png'),
                                      width: MediaQuery.of(context).size.width *
                                          0.15),
                                  Flexible(
                                    child: MyTextEormField(
                                        Icon(FontAwesomeIcons.at),
                                        'atcoder_handle',
                                        false, (val) {
                                      atcoder = val;
                                    },
                                        TextInputType.name,
                                        (val) => val
                                                .trim()
                                                .toString()
                                                .contains(' ')
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
                                    image:
                                        AssetImage('images/spojwhitelogo.png'),
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                  ),
                                  Flexible(
                                    child: MyTextEormField(
                                        Icon(FontAwesomeIcons.at),
                                        'spoj_handle',
                                        false, (val) {
                                      spoj = val;
                                    },
                                        TextInputType.name,
                                        (val) => val
                                                .trim()
                                                .toString()
                                                .contains(' ')
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
                            child: MyButton(ColorSchemeClass.primarygreen,
                                'Create Account', _submit),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))),
          );
  }
}
