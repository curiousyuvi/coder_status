import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/registeremailidscreen1.dart';
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

void main() => runApp(
      MaterialApp(
        home: registercodernamescreen(),
      ),
    );

class registercodernamescreen extends StatefulWidget {
  const registercodernamescreen({Key key}) : super(key: key);

  @override
  _registercodernamescreenState createState() =>
      _registercodernamescreenState();
}

class _registercodernamescreenState extends State<registercodernamescreen> {
  String codername = '';
  final _formkey = GlobalKey<FormState>();

  void _submit() {
    print('Next pressed!!!');
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print(codername);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return registeremailidscreen1();
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
                        color: colorschemeclass.darkgrey,
                        fontSize: 15,
                        fontFamily: 'young'),
                    textAlign: TextAlign.center,
                  ),
                )),
                Flexible(
                    child: myTextEormField(
                        Icon(Icons.alternate_email), 'codername', false, (val) {
                  codername = val;
                },
                        TextInputType.text,
                        (val) => (val.trim().contains(' ') ||
                                val.trim().length < 5)
                            ? 'Codername can only be consist a single word'
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
