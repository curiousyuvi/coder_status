import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/generalLoader.dart';
import 'package:codersstatus/components/showAnimatedToast.dart';
import 'package:codersstatus/forgotPasswordscreen.dart';
import 'package:codersstatus/homeScreen.dart';
import 'package:codersstatus/firebase_layer/loginUser.dart';
import 'package:codersstatus/registerEmailidScreen.dart';
import 'package:codersstatus/verifyEmailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'components/myTextFormField.dart';
import 'components/myButton.dart';

void main() => runApp(
      MaterialApp(
        home: SignInEmailScreen(),
      ),
    );

class SignInEmailScreen extends StatefulWidget {
  const SignInEmailScreen({Key key}) : super(key: key);

  @override
  _SignInEmailScreenState createState() => _SignInEmailScreenState();
}

class _SignInEmailScreenState extends State<SignInEmailScreen> {
  //Form State

  final _formkey = GlobalKey<FormState>();
  String emailid = '';
  String password = '';
  bool isLoading = false;

  void _submit() async {
    FocusScopeNode currentFocus = FocusScope.of(context);
    print('login pressed!!!');
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print(emailid + ' ' + password);
      setState(() {
        isLoading = true;
      });
      login(emailid.trim(), password.trim()).then((user) async {
        if (user != null) {
          bool flag;
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get()
              .then((doc) {
            flag = doc.exists;
          });
          if (flag) {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }), ModalRoute.withName('/home'));
          } else {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return VerifyEmailScreen();
            }), ModalRoute.withName('/emailVerify'));
          }
        } else {
          setState(() {
            isLoading = false;
          });

          showAnimatedToast(
              this.context, 'Email or Password or both are incorrect.', false);
        }
      });
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
            body: SafeArea(
              child: Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Hero(
                          tag: 'appIcon',
                          child: Image(
                            width: MediaQuery.of(context).size.width * 0.5,
                            image: AssetImage('images/appiconnoback.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'headline',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.06),
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      MyTextEormField(Icon(Icons.email), 'Email Id', false,
                          (val) {
                        emailid = val;
                      },
                          TextInputType.emailAddress,
                          (val) => !val.contains('@')
                              ? 'Please enter a valid email'
                              : null),
                      MyTextEormField(Icon(Icons.vpn_key), 'Password', true,
                          (val) {
                        password = val;
                      },
                          TextInputType.visiblePassword,
                          (val) => val.trim().length < 6
                              ? 'Please enter a valid password'
                              : null),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03,
                            vertical:
                                MediaQuery.of(context).size.height * 0.01),
                        height: MediaQuery.of(context).size.height * 0.09,
                        child: MyButton(
                            ColorSchemeClass.primarygreen, 'Log in', _submit),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Flexible(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegisterEmailidScreen();
                              }));
                            },
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                  color: ColorSchemeClass.primarygreen,
                                  fontFamily: 'young',
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.022,
                                  decoration: TextDecoration.underline),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Flexible(
                        child: GestureDetector(
                            onTap: () {
                              print('forgot password clicked!!');
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Forgotpasswordscreen();
                              }));
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'young',
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  decoration: TextDecoration.underline),
                            )),
                      )
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
