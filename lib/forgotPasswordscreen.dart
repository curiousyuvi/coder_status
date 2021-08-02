import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/showAnimatedToast.dart';
import 'package:codersstatus/firebase_layer/resetPassword.dart';
import 'package:codersstatus/signinScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'components/myTextFormField.dart';
import 'components/myButton.dart';

void main() => runApp(
      MaterialApp(
        home: Forgotpasswordscreen(),
      ),
    );

class Forgotpasswordscreen extends StatefulWidget {
  const Forgotpasswordscreen({Key key}) : super(key: key);

  @override
  _ForgotpasswordscreenState createState() => _ForgotpasswordscreenState();
}

class _ForgotpasswordscreenState extends State<Forgotpasswordscreen> {
  //Form State

  final _formkey = GlobalKey<FormState>();
  String emailid = '';

  void _submit() {
    print('login pressed!!!');
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print(emailid);

      resetpassword(emailid);

      showAnimatedToast(this.context,
          'A paaswod reset link was succesfully sent to your email.', true);

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Signinscreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemeClass.dark,
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
                      image: AssetImage('images/appiconnoback.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Flexible(
                    child: Text(
                  'Enter Email Id',
                  style: TextStyle(
                      color: Colors.white, fontSize: 25, fontFamily: 'young'),
                )),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                    child: Text(
                        'A passowrd reset link will be sent to your given Email',
                        style: TextStyle(
                            color: ColorSchemeClass.darkgrey,
                            fontSize: 15,
                            fontFamily: 'young'),
                        textAlign: TextAlign.center)),
                Flexible(
                    child: MyTextEormField(Icon(Icons.email), 'Email Id', false,
                        (val) {
                  emailid = val;
                },
                        TextInputType.emailAddress,
                        (val) => !val.contains('@')
                            ? 'Please enter a valid email'
                            : null)),
                Flexible(
                    child: MyButton(ColorSchemeClass.primarygreen,
                        'Send Request', _submit)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
