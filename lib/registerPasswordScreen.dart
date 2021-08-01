import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/showAnimatedToast.dart';
import 'package:codersstatus/components/urls.dart';
import 'package:codersstatus/firebase_layer/emailVerification.dart';
import 'package:codersstatus/firebase_layer/setUserInfo.dart';
import 'package:codersstatus/registerAvatarScreen.dart';
import 'package:codersstatus/signinScreen.dart';
import 'package:codersstatus/verifyEmailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'components/myTextFormField.dart';
import 'components/myButton.dart';
import 'package:codersstatus/firebase_layer/createuser.dart';

void main() => runApp(
      MaterialApp(
        home: Registerpasswordscreen('example@email'),
      ),
    );

class Registerpasswordscreen extends StatefulWidget {
  Registerpasswordscreen(String emailid) {
    _RegisterpasswordscreenState.emailid = emailid;
  }

  @override
  _RegisterpasswordscreenState createState() => _RegisterpasswordscreenState();
}

class _RegisterpasswordscreenState extends State<Registerpasswordscreen> {
  static String emailid = '';
  String password = '';
  bool isloading = false;

  final _formkey = GlobalKey<FormState>();

  void _submit() {
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

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return VerifyEmailScreen();
          }));
        } else {
          setState(() {
            isloading = false;
          });
          showAnimatedToast(
              this.context, 'Email already exists, head to sign in', false);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Signinscreen();
          }));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            backgroundColor: colorschemeclass.dark,
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Hero(
                          tag: 'splashscreenImage',
                          child: Image(
                            width: 300,
                            image: AssetImage('images/appiconnoback.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Flexible(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Choose Password',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'young'),
                        ),
                      )),
                      Flexible(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Use a combination of letters, digits and special characters',
                            style: TextStyle(
                                color: colorschemeclass.darkgrey,
                                fontSize: 15,
                                fontFamily: 'young'),
                            textAlign: TextAlign.center),
                      )),
                      myTextEormField(Icon(Icons.vpn_key), 'password', true,
                          (val) {
                        setState(() {
                          password = val;
                        });
                      },
                          TextInputType.visiblePassword,
                          (val) => val.trim().length < 6
                              ? 'Password must contain atleast 6 characters'
                              : null),
                      myTextEormField(
                          Icon(Icons.vpn_key),
                          'confirm password',
                          true,
                          (val) {},
                          TextInputType.visiblePassword,
                          (val) => val != password
                              ? 'Password doesn\'t match'
                              : null),
                      Container(
                          padding: EdgeInsets.all(8),
                          height: MediaQuery.of(context).size.height * 0.11,
                          child: myButton(
                              colorschemeclass.primarygreen, 'Next', _submit))
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
