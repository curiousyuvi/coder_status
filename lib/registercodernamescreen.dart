import 'package:codersstatus/colorscheme.dart';
import 'package:codersstatus/registernamescreen.dart';
import 'package:codersstatus/registerpasswoedscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'myTextField.dart';
import 'coderstatusheading.dart';
import 'myButton.dart';

void main() => runApp(
  MaterialApp(
    home: registercodernamescreen(),
  ),
);

class registercodernamescreen extends StatefulWidget {
  const registercodernamescreen({Key key}) : super(key: key);

  @override
  _registercodernamescreenState createState() => _registercodernamescreenState();
}

class _registercodernamescreenState extends State<registercodernamescreen> {
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
              SizedBox(
                height: 50,
              ),
              Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Choose Codername',
                      style: TextStyle(
                          color: Colors.white, fontSize: 25, fontFamily: 'young'),
                    ),
                  )),
              Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Codername is like a Username ,*Example: @demon_lord',
                      style: TextStyle(
                          color: colorschemeclass.darkgrey, fontSize: 15, fontFamily: 'young'),
                    ),
                  )),
              Flexible(child: myTextField(Icon(Icons.alternate_email), 'codername')),
              Flexible(
                  child: myButton(true, 'Next', () {
                    print('Next pressed!!!');
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
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
