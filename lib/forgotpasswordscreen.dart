import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/homescreen.dart';
import 'package:codersstatus/loginuser.dart';
import 'package:codersstatus/registernamescreen.dart';
import 'package:codersstatus/resetpassword.dart';
import 'package:codersstatus/signinscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'components/constants.dart';
import 'components/myTextFormField.dart';
import 'components/coderstatusheading.dart';
import 'components/myButton.dart';

void main() => runApp(
      MaterialApp(
        home: forgotpasswordscreen(),
      ),
    );

class forgotpasswordscreen extends StatefulWidget {
  const forgotpasswordscreen({Key key}) : super(key: key);

  @override
  _forgotpasswordscreenState createState() => _forgotpasswordscreenState();
}

class _forgotpasswordscreenState extends State<forgotpasswordscreen> {
  //Form State

  final _formkey = GlobalKey<FormState>();
  String emailid = '';

  void _submit() {
    print('login pressed!!!');
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print(emailid);

      resetpassword(emailid);

      Fluttertoast.showToast(
          msg: "A paaswod reset link was  succesfully sent to your email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: colorschemeclass.primarygreen,
          textColor: Colors.white,
          fontSize: 16.0);

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return signinscreen();
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
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'young'),
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                          child: Text(
                              'A passowrd reset link will be sent to your given Email',
                              style: TextStyle(
                                  color: colorschemeclass.darkgrey,
                                  fontSize: 15,
                                  fontFamily: 'young'),
                              textAlign: TextAlign.center)),
                      Flexible(
                          child: myTextEormField(
                              Icon(Icons.email), 'Email Id', false, (val) {
                        emailid = val;
                      },
                              TextInputType.emailAddress,
                              (val) => !val.contains('@')
                                  ? 'Please enter a valid email'
                                  : null)),
                      Flexible(child: myButton(true, 'Send Request', _submit)),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
