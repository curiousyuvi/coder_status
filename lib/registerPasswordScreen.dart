import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/showAnimatedToast.dart';
import 'package:codersstatus/firebase_layer/emailVerification.dart';
import 'package:codersstatus/signinScreen.dart';
import 'package:codersstatus/verifyEmailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/generalLoader.dart';
import 'components/myTextFormField.dart';
import 'components/myButton.dart';
import 'package:codersstatus/firebase_layer/createuser.dart';

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

  final _formkey = GlobalKey<FormState>();

  void _submit() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    print("Register initiated!!");
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print(emailid + ' ' + password);
      setState(() {
        isloading = true;
      });

      createAccount(emailid, password).then((user) {
        if (user != null) {
          print('account created');

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
            return Signinscreen();
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
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Flexible(
                            child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.02),
                          child: Text(
                            'Choose Password',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.035,
                                fontFamily: 'young'),
                          ),
                        )),
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
                        MyTextEormField(
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
                        MyTextEormField(
                            Icon(FontAwesomeIcons.key),
                            'confirm password',
                            true,
                            (val) {},
                            TextInputType.visiblePassword,
                            (val) => val != password
                                ? 'Password doesn\'t match'
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
