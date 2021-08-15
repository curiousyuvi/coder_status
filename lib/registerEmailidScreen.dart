import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/generalLoader.dart';
import 'package:codersstatus/components/myDividerWithTitle.dart';
import 'package:codersstatus/components/showAnimatedToast.dart';
import 'package:codersstatus/firebase_layer/googleSignInProvider.dart';
import 'package:codersstatus/registerCodernameScreen.dart';
import 'package:codersstatus/signinScreen.dart';
import 'package:codersstatus/registerPasswordScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'components/myTextFormField.dart';
import 'components/myButton.dart';
import 'homeScreen.dart';

class RegisterEmailidScreen extends StatefulWidget {
  @override
  _RegisterEmailidScreenState createState() => _RegisterEmailidScreenState();
}

class _RegisterEmailidScreenState extends State<RegisterEmailidScreen> {
  String emailid = '';
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;

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
                      Flexible(
                        child: Hero(
                          tag: 'appIcon',
                          child: Image(
                            width: MediaQuery.of(context).size.width * 0.4,
                            image: AssetImage('images/appiconnoback.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'headline',
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.06),
                              children: [
                                TextSpan(
                                  text: 'CODER',
                                ),
                                TextSpan(
                                    text: ' STATUS',
                                    style: TextStyle(
                                        color: ColorSchemeClass.primarygreen))
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Flexible(
                          child: Text(
                        'Sign Up With ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontFamily: 'young'),
                      )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final provider = Provider.of<GoogleSigInProvider>(
                                  context,
                                  listen: false);

                              setState(() {
                                isLoading = true;
                              });
                              final user = await provider.googleLogin();

                              if (user == null) {
                                setState(() {
                                  isLoading = false;
                                });
                                showAnimatedToast(this.context,
                                    'Something went wrong', false);
                              } else {
                                bool flag = false;
                                try {
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(user.uid)
                                      .get()
                                      .then((doc) {
                                    flag = doc.exists;
                                  });
                                } catch (e) {
                                  flag = false;
                                }

                                if (flag) {
                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(builder: (context) {
                                    return HomeScreen();
                                  }), ModalRoute.withName('/home'));
                                } else {
                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Registercodernamescreen(
                                        user.displayName.toString().trim());
                                  }), ModalRoute.withName('/home'));
                                }
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.google,
                                  color: ColorSchemeClass.primarygreen,
                                  size:
                                      MediaQuery.of(context).size.height * 0.06,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.007,
                                ),
                                Text(
                                  'Google',
                                  style: TextStyle(
                                    color: ColorSchemeClass.primarygreen,
                                    fontFamily: 'young',
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                FontAwesomeIcons.github,
                                color: ColorSchemeClass.primarygreen,
                                size: MediaQuery.of(context).size.height * 0.06,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                'Github',
                                style: TextStyle(
                                  color: ColorSchemeClass.primarygreen,
                                  fontFamily: 'young',
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      MyMidDividerWithTitle('OR'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Flexible(
                          child: Text(
                        'Sign Up With Email Id',
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
                      MyTextEormField(Icon(FontAwesomeIcons.solidEnvelope),
                          'email id', false, (val) {
                        emailid = val;
                      },
                          TextInputType.emailAddress,
                          (val) => !val.contains('@')
                              ? 'Please enter a valid email'
                              : null),
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
                              return Signinscreen();
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
