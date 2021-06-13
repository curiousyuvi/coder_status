import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/homescreen.dart';
import 'package:codersstatus/loginuser.dart';
import 'package:codersstatus/registernamescreen.dart';
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
        home: signinscreen(),
      ),
    );

class signinscreen extends StatefulWidget {
  const signinscreen({Key key}) : super(key: key);

  @override
  _signinscreenState createState() => _signinscreenState();
}

class _signinscreenState extends State<signinscreen> {
  //Form State

  final _formkey = GlobalKey<FormState>();
  String emailid = '';
  String password = '';
  bool isloading=false;

  void _submit() {
    print('login pressed!!!');
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print(emailid + ' ' + password);
      setState(() {
        isloading=true;
      });
      login(emailid, password).then((user){
        if(user!=null) {
          print('login succesfull');
          setState(() {
            isloading=false;
          });
        }
        else
          {
            print('login failed');
          }

      });
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return homescreen();
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
                      image: AssetImage('images/appiconnoback.png'),
                    ),
                  ),
                ),
                Flexible(
                  child: coderstatusheading(),
                ),
                SizedBox(
                  height: 50,
                ),
                Flexible(
                    child: myTextEormField(Icon(Icons.email), 'Email Id', false,
                        (val) {
                  emailid = val;
                },
                        TextInputType.emailAddress,
                        (val) => !val.contains('@')
                            ? 'Please enter a valid email'
                            : null)),
                Flexible(
                    child: myTextEormField(
                        Icon(Icons.vpn_key), 'Password', true, (val) {
                  password = val;
                },
                        TextInputType.visiblePassword,
                        (val) => val.trim().length < 6
                            ? 'Please enter a valid password'
                            : null)),
                Flexible(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: myButton(true, 'Log in', _submit),
                    ),
                    Flexible(
                      child: myButton(false, 'Register', () {
                        print('register pressed!!!');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return registernamescreen();
                        }));
                      }),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
