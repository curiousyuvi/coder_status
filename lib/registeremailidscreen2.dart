import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/registernamescreen.dart';
import 'package:codersstatus/registerpasswordscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'components/constants.dart';
import 'components/myTextFormField.dart';
import 'components/coderstatusheading.dart';
import 'components/myButton.dart';
import 'homescreen.dart';

void main() => runApp(
      MaterialApp(
        home: registeremailidscreen2('example name','examplecodername','example@email'),
      ),
    );

class registeremailidscreen2 extends StatefulWidget {
  registeremailidscreen2(String name, String codername, String emailid) {
    _registeremailidscreen2State.name = name;
    _registeremailidscreen2State.codername = codername;
    _registeremailidscreen2State.emailid = emailid;
  }

  @override
  _registeremailidscreen2State createState() => _registeremailidscreen2State();
}

class _registeremailidscreen2State extends State<registeremailidscreen2> {
  static String name = '';
  static String codername = '';
  static String emailid = '';
  String otp = '';
  final _formkey = GlobalKey<FormState>();

  void _submit() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();



      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return registerpasswordscreen(name,codername,emailid);
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
                        'Enter the OTP you receive on your email',
                        style: TextStyle(
                            color: colorschemeclass.darkgrey,
                            fontSize: 15,
                            fontFamily: 'young'),
                        textAlign: TextAlign.center)),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                    child: myTextEormField(
                        Icon(Icons.lock), 'OTP', true, (val) {
                  otp = val;
                },
                        TextInputType.visiblePassword,
                        (val) => val.trim().contains(' ')
                            ? 'Please enter a valid verification code'
                            : null)),
                Flexible(child: myButton(true, 'Next', _submit))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
