import 'package:codersstatus/components/colorscheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'components/constants.dart';
import 'components/myTextFormField.dart';
import 'components/myButton.dart';
import 'homescreen.dart';
import 'registernamescreen.dart';
import 'registercodernamescreen.dart';
import 'registeremailidscreen1.dart';
import 'createuser.dart';

void main() => runApp(
      MaterialApp(
        home: registerpasswordscreen('example name','examplecodername','example@email'),
      ),
    );

class registerpasswordscreen extends StatefulWidget {
  registerpasswordscreen(String name, String codername, String emailid) {
    _registerpasswordscreenState.name = name;
    _registerpasswordscreenState.codername = codername;
    _registerpasswordscreenState.emailid = emailid;
  }

  @override
  _registerpasswordscreenState createState() => _registerpasswordscreenState();
}

class _registerpasswordscreenState extends State<registerpasswordscreen> {
  static String name = '';
  static String codername = '';
  static String emailid = '';
  String password = '';
  bool isloading = false;

  final _formkey = GlobalKey<FormState>();

  void _submit() {
    print("Register initiated!!");
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print(name+' '+codername+' '+emailid+' '+password);
      setState(() {
        isloading =true;
      });

      createAccount(name, codername, emailid, password)
      .then((user){
        if(user!=null)
          {
            print('account created');
          }
        else
          {
            print('not');
          }
      });

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return homescreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return isloading? Scaffold(body: Center(child: CircularProgressIndicator(),),):Scaffold(
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
                    'Choose Password',
                    style: TextStyle(
                        color: Colors.white, fontSize: 25, fontFamily: 'young'),
                  ),
                )),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Use a combination of letters, digits and special characters',
                      style: TextStyle(
                          color: colorschemeclass.darkgrey,
                          fontSize: 15,
                          fontFamily: 'young'),
                      textAlign: TextAlign.center),
                )),
                Flexible(
                    child: myTextEormField(
                        Icon(Icons.vpn_key), 'password', true, (val) {
                  setState(() {
                    password = val;
                  });
                },
                        TextInputType.visiblePassword,
                        (val) => val.trim().length < 6
                            ? 'Password must contain atleast 6 characters'
                            : null)),
                Flexible(
                    child: myTextEormField(
                        Icon(Icons.vpn_key),
                        'confirm password',
                        true,
                        (val) {},
                        TextInputType.visiblePassword,
                        (val) => val != password
                            ? 'Password doesn\'t match'
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
