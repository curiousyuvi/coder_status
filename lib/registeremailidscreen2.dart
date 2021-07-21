import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myFtoast.dart';
import 'package:codersstatus/registerpasswordscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'components/myTextFormField.dart';
import 'components/myButton.dart';
import 'package:email_auth/email_auth.dart';

class Registeremailidscreen2 extends StatefulWidget {
  Registeremailidscreen2(String name, String codername, String emailid) {
    _Registeremailidscreen2State.name = name;
    _Registeremailidscreen2State.codername = codername;
    _Registeremailidscreen2State.emailid = emailid;
  }

  @override
  _Registeremailidscreen2State createState() => _Registeremailidscreen2State();
}

class _Registeremailidscreen2State extends State<Registeremailidscreen2> {
  static String name = '';
  static String codername = '';
  static String emailid = '';
  String otp = '';
  final _formkey = GlobalKey<FormState>();

  bool verifyOTP(String otp) {
    var res = EmailAuth.validate(receiverMail: emailid, userOTP: otp);
    if (res) {
      return true;
    } else {
      return false;
    }
  }

  void _submit() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

      showFToast(this.context, 'Account created successfully.', true);

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Registerpasswordscreen(name, codername, emailid);
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
                    child: Text('Enter the OTP you received on your email',
                        style: TextStyle(
                            color: colorschemeclass.darkgrey,
                            fontSize: 15,
                            fontFamily: 'young'),
                        textAlign: TextAlign.center)),
                SizedBox(
                  height: 10,
                ),
                myTextEormField(Icon(Icons.lock), 'OTP', true, (val) {
                  otp = val;
                },
                    TextInputType.visiblePassword,
                    (val) =>
                        !verifyOTP(val.trim()) ? 'OTP doesn\'t match' : null),
                Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height * 0.11,
                    child: myButton(colorschemeclass.primarygreen,
                        'Create Account', _submit))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
