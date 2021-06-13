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
import 'mybadgesscreen.dart';

void main() => runApp(
      MaterialApp(
        home: registeremailidscreen2(),
      ),
    );

class registeremailidscreen2 extends StatefulWidget {
  const registeremailidscreen2({Key key}) : super(key: key);

  @override
  _registeremailidscreen2State createState() => _registeremailidscreen2State();
}

class _registeremailidscreen2State extends State<registeremailidscreen2> {
  String otp = '';
  final _formkey = GlobalKey<FormState>();

  void _submit() {
    print('login pressed!!!');
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print(otp);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return mybadgesscreen();
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
                        'Enter the confirmation code you receive on your email',
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
                        Icon(Icons.check), 'confirmation code', true, (val) {
                  otp = val;
                },
                        TextInputType.visiblePassword,
                        (val) => val.contains(' ')
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
