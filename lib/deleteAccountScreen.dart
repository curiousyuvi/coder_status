import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/generalLoadingScreen.dart';
import 'package:codersstatus/components/generalOverlayLoadingScreen.dart';
import 'package:codersstatus/components/myAppBarWithBack.dart';
import 'package:codersstatus/components/myOutlineButton.dart';
import 'package:codersstatus/components/urls.dart';
import 'package:codersstatus/firebase_layer/deleteuser.dart';
import 'package:codersstatus/firebase_layer/setUserInfo.dart';
import 'package:codersstatus/firebase_layer/updatepassword.dart';
import 'package:codersstatus/firebase_layer/validatepassword.dart';
import 'package:codersstatus/registeravatarscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'components/constants.dart';
import 'components/myTextFormField.dart';
import 'components/myButton.dart';
import 'mydashboardscreen.dart';
import 'package:codersstatus/firebase_layer/createuser.dart';

class DeleteAccountScreen extends StatefulWidget {
  @override
  _DeleteAccountScreenState createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  String password = '';
  bool passwordmatch = false;

  final _formkey = GlobalKey<FormState>();

  void _submit() async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry1;
    overlayEntry1 = OverlayEntry(builder: (context) {
      return GeneralOverlayLoadingScreen('Verifying Password');
    });
    OverlayEntry overlayEntry2;
    overlayEntry2 = OverlayEntry(builder: (context) {
      return GeneralOverlayLoadingScreen('Deleting Account');
    });

    //start loader
    overlayState.insert(overlayEntry1);

    passwordmatch = await validatePassword(password);
    print('bool updated!!');

    //stop loader
    overlayEntry1.remove();

    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      //start loader
      overlayState.insert(overlayEntry2);
      try {
        await deleteUser(password);
        Phoenix.rebirth(context);
      } catch (e) {
        print(e);
      }

      //end loader
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorschemeclass.dark,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
        child: myAppBarWithBack('Delete Account'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(stops: [
                        0.0,
                        0.5,
                      ], colors: [
                        colorschemeclass.morphdangerred,
                        colorschemeclass.unactivatedblack,
                      ])),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.16,
                      child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.03),
                          child: Row(
                            children: [
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: colorschemeclass.dangerred),
                                  child: Icon(Icons.priority_high)),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.06,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Account Delete Alert',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: colorschemeclass.dangerred,
                                        fontFamily: 'young',
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.03),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Flexible(
                                    child: Text(
                                      'If you continue further all your\naccount\'s data will be lost.\nYou will have to create a new\naccount from scratch',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: colorschemeclass.lightgrey,
                                          fontFamily: 'young',
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Theme(
                  data: ThemeData(
                      accentColor: colorschemeclass.dangerred,
                      primaryColor: colorschemeclass.dangerred),
                  child: myTextEormField(
                      Icon(Icons.vpn_key),
                      'Enter Password',
                      true,
                      (val) {
                        password = val;
                      },
                      TextInputType.visiblePassword,
                      (password) {
                        return passwordmatch ? null : 'Password is incorrect';
                      },
                      colorschemeclass.dangerred),
                ),
                Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height * 0.11,
                    child: myButton(
                        colorschemeclass.dangerred, 'Delete Account', _submit))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
