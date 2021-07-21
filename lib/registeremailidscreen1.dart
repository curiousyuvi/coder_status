import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myFtoast.dart';
import 'package:codersstatus/registeremailidscreen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'components/myTextFormField.dart';
import 'components/myButton.dart';
import 'package:email_auth/email_auth.dart';

class Registeremailidscreen1 extends StatefulWidget {
  Registeremailidscreen1(String name, String codername) {
    _Registeremailidscreen1State.name = name;
    _Registeremailidscreen1State.codername = codername;
  }

  @override
  _Registeremailidscreen1State createState() => _Registeremailidscreen1State();
}

class _Registeremailidscreen1State extends State<Registeremailidscreen1> {
  static String name = '';
  static String codername = '';

  String emailid = '';
  final _formkey = GlobalKey<FormState>();

  void _submit() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      sendOTP();
      showFToast(this.context, 'OTP sent to Email successfully.', true);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Registeremailidscreen2(name, codername, emailid);
      }));
    }
  }

  void sendOTP() async {
    EmailAuth.sessionName = "Email Register";
    await EmailAuth.sendOtp(receiverMail: emailid);
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
                    child: Text('An OTP will be sent to your given Email',
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
