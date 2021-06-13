import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/registeremailidscreen2.dart';
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
        home: registeremailidscreen1('example name','examplecodername'),
      ),
    );

class registeremailidscreen1 extends StatefulWidget {
  registeremailidscreen1(String name,String codername){
    _registeremailidscreen1State.name=name;
    _registeremailidscreen1State.codername=codername;

  }

  @override
  _registeremailidscreen1State createState() => _registeremailidscreen1State();
}

class _registeremailidscreen1State extends State<registeremailidscreen1> {
  static String name='';
  static String codername='';

  String emailid = '';
  final _formkey = GlobalKey<FormState>();

  void _submit() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return registeremailidscreen2(name,codername,emailid);
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
                        'An OTP will be sent to your given Email',
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
                        Icon(Icons.email_sharp), 'email id', false, (val) {
                  emailid = val;
                },
                        TextInputType.emailAddress,
                        (val) => !val.contains('@')
                            ? 'Please enter a valid email'
                            : null)),
                Flexible(
                    child: myButton(false, 'Send OTP', _submit)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
