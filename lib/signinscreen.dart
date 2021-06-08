import 'package:codersstatus/colorscheme.dart';
import 'package:codersstatus/registerscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';

void main() => runApp(
      MaterialApp(
        home: enternamescreen(),
      ),
    );

class enternamescreen extends StatefulWidget {
  const enternamescreen({Key key}) : super(key: key);

  @override
  _enternamescreenState createState() => _enternamescreenState();
}

class _enternamescreenState extends State<enternamescreen> {
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
                child: Image(
                  image: AssetImage('images/appiconnoback.png'),
                ),
              ),
              Flexible(
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Text(
                      'CODER',
                      style: TextStyle(
                          fontFamily: 'young',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 50),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'STATUS',
                      style: TextStyle(
                          fontFamily: 'young',
                          color: colorschemeclass.primarygreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          shadows: [
                            Shadow(
                                blurRadius: 5,
                                color: colorschemeclass.primarygreen
                                    .withOpacity(0.7),
                                offset: Offset(5.0, 0)),
                            Shadow(
                                blurRadius: 5,
                                color: colorschemeclass.primarygreen
                                    .withOpacity(0.7),
                                offset: Offset(-5.0, 0)),
                            Shadow(
                                // bottomLeft
                                offset: Offset(-1, -1),
                                color: Colors.white),
                            Shadow(
                                // bottomRight
                                offset: Offset(1, -1),
                                color: Colors.white),
                            Shadow(
                                // topRight
                                offset: Offset(1, 1),
                                color: Colors.white),
                            Shadow(
                                // topLeft
                                offset: Offset(-1, 1),
                                color: Colors.white)
                          ]),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Flexible(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  cursorColor: colorschemeclass.primarygreen,
                  obscureText: false,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'young',
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                  decoration: myInputDecoration.copyWith(
                      hintText: 'Email Id', prefixIcon: Icon(Icons.email)),
                ),
              )),
              Flexible(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  cursorColor: colorschemeclass.primarygreen,
                  obscureText: false,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'young',
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                  decoration: myInputDecoration.copyWith(
                      hintText: 'Password', prefixIcon: Icon(Icons.vpn_key)),
                ),
              )),
              Flexible(
                  child: Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Material(
                        elevation: 15,
                        color: colorschemeclass.primarygreen,
                        shadowColor: colorschemeclass.secondarygreen,
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          height: 50,
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.login,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'SIGN IN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'young',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Material(
                        elevation: 15,
                        color: Colors.white,
                        shadowColor: colorschemeclass.lightgrey,
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          height: 50,
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.app_registration,
                                color: colorschemeclass.unactivatedblack,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'REGISTER',
                                style: TextStyle(
                                    color: colorschemeclass.unactivatedblack,
                                    fontFamily: 'young',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
