import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/registeremailidscreen1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'components/myTextFormField.dart';
import 'components/myButton.dart';

class Registercodernamescreen extends StatefulWidget {
  Registercodernamescreen(String name) {
    _RegistercodernamescreenState.name = name;
  }

  @override
  _RegistercodernamescreenState createState() =>
      _RegistercodernamescreenState();
}

class _RegistercodernamescreenState extends State<Registercodernamescreen> {
  static String name = '';
  String codername = '';
  final _formkey = GlobalKey<FormState>();

  void _submit() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Registeremailidscreen1(name, codername);
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
                myTextEormField(Icon(Icons.alternate_email), 'codername', false,
                    (val) {
                  codername = val;
                },
                    TextInputType.text,
                    (val) => (val.trim().contains(' ') || val.trim().length < 5)
                        ? 'Codername can only be consist a single word'
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
