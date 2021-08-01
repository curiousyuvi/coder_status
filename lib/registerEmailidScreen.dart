import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/showAnimatedToast.dart';
import 'package:codersstatus/firebase_layer/emailVerification.dart';
import 'package:codersstatus/verifyEmailScreen.dart';
import 'package:codersstatus/registerPasswordScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'components/myTextFormField.dart';
import 'components/myButton.dart';

class RegisterEmailidScreen extends StatefulWidget {
  @override
  _RegisterEmailidScreenState createState() => _RegisterEmailidScreenState();
}

class _RegisterEmailidScreenState extends State<RegisterEmailidScreen> {
  String emailid = '';
  final _formkey = GlobalKey<FormState>();

  void _submit() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Registerpasswordscreen(emailid);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Flexible(
                  child: SizedBox(
                    height: 20,
                  ),
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
                        'A verification link will be sent to your given Email',
                        style: TextStyle(
                            color: colorschemeclass.darkgrey,
                            fontSize: 15,
                            fontFamily: 'young'),
                        textAlign: TextAlign.center)),
                SizedBox(
                  height: 10,
                ),
                myTextEormField(Icon(Icons.email_sharp), 'email id', false,
                    (val) {
                  emailid = val;
                },
                    TextInputType.emailAddress,
                    (val) => !val.contains('@')
                        ? 'Please enter a valid email'
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
