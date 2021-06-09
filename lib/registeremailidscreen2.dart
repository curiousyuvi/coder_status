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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorschemeclass.dark,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
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
              Flexible(
                  child: myTextEormField(
                      Icon(Icons.check), 'confirmation code', true, (val) {
                setState(() {
                  otp = val;
                });
              }, TextInputType.visiblePassword)),
              Flexible(
                  child: myButton(true, 'Next', () {
                print(otp);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return registerpasswordscreen();
                }));
              }))
            ],
          ),
        ),
      ),
    );
  }
}
