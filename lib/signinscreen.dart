import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/generalLoadingScreen.dart';
import 'package:codersstatus/components/myFtoast.dart';
import 'package:codersstatus/forgotpasswordscreen.dart';
import 'package:codersstatus/homescreen.dart';
import 'package:codersstatus/firebase_layer/loginuser.dart';
import 'package:codersstatus/registernamescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'components/myTextFormField.dart';
import 'components/coderstatusheading.dart';
import 'components/myButton.dart';

void main() => runApp(
      MaterialApp(
        home: Signinscreen(),
      ),
    );

class Signinscreen extends StatefulWidget {
  const Signinscreen({Key key}) : super(key: key);

  @override
  _SigninscreenState createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  //Form State

  final _formkey = GlobalKey<FormState>();
  String emailid = '';
  String password = '';
  bool isloading = false;

  void _submit() {
    print('login pressed!!!');
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print(emailid + ' ' + password);
      setState(() {
        isloading = true;
      });
      login(emailid.trim(), password.trim()).then((user) {
        if (user != null) {
          showFToast(this.context, 'Log In successfull.', true);
          setState(() {
            isloading = false;
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }));
        } else {
          setState(() {
            isloading = false;
          });

          showFToast(
              this.context, 'Email or Password or both are incorrect.', false);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? GeneralLoadingScreen('Logging in the user...')
        : Scaffold(
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Hero(
                          tag: 'splashscreenImage',
                          child: Image(
                            image: AssetImage('images/appiconnoback.png'),
                            height: MediaQuery.of(context).size.height * 0.2,
                          ),
                        ),
                      ),
                      Flexible(child: coderstatusheading(context)),
                      Flexible(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: myTextEormField(
                            Icon(Icons.email), 'Email Id', false, (val) {
                          emailid = val;
                        },
                            TextInputType.emailAddress,
                            (val) => !val.contains('@')
                                ? 'Please enter a valid email'
                                : null),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: myTextEormField(
                            Icon(Icons.vpn_key), 'Password', true, (val) {
                          password = val;
                        },
                            TextInputType.visiblePassword,
                            (val) => val.trim().length < 6
                                ? 'Please enter a valid password'
                                : null),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        height: MediaQuery.of(context).size.height * 0.09,
                        child: myButton(
                            colorschemeclass.primarygreen, 'Log in', _submit),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Flexible(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Registernamescreen();
                              }));
                            },
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                  color: colorschemeclass.primarygreen,
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
          );
  }
}
