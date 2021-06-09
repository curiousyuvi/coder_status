import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/mybadgesscreen.dart';
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
  String emailid = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorschemeclass.dark,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
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
                  setState(() {
                    emailid = val;
                  });
                },TextInputType.emailAddress)),
                Flexible(
                    child: myTextEormField(
                        Icon(Icons.vpn_key), 'Password', true, (val) {
                  setState(() {
                    password = val;
                  });
                },TextInputType.visiblePassword)),
                Flexible(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: myButton(true, 'Log in', () {
                        print('login pressed!!!');
                        print(emailid+' '+password);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return mybadgesscreen();
                        }));
                      }),
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
