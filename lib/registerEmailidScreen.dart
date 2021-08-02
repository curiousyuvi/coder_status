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
    return GestureDetector(
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
                        width: MediaQuery.of(context).size.width * 0.5,
                        image: AssetImage('images/appiconnoback.png'),
                      ),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ),
                  Flexible(
                      child: Text(
                    'Enter Email Id',
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
                  MyTextEormField(Icon(Icons.email_sharp), 'email id', false,
                      (val) {
                    emailid = val;
                  },
                      TextInputType.emailAddress,
                      (val) => !val.contains('@')
                          ? 'Please enter a valid email'
                          : null),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                        vertical: MediaQuery.of(context).size.height * 0.01),
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
