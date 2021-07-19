import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/generalLoadingScreen.dart';
import 'package:codersstatus/components/generalOverlayLoadingScreen.dart';
import 'package:codersstatus/components/myOutlineButton.dart';
import 'package:codersstatus/components/urls.dart';
import 'package:codersstatus/firebase_layer/setUserInfo.dart';
import 'package:codersstatus/firebase_layer/updatepassword.dart';
import 'package:codersstatus/firebase_layer/validatepassword.dart';
import 'package:codersstatus/registeravatarscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'components/constants.dart';
import 'components/myTextFormField.dart';
import 'components/myButton.dart';
import 'mydashboardscreen.dart';
import 'package:codersstatus/firebase_layer/createuser.dart';
import 'components/myAppBarWithBack.dart';

class updatePasswordScreen extends StatefulWidget {
  @override
  _updatePasswordScreenState createState() => _updatePasswordScreenState();
}

class _updatePasswordScreenState extends State<updatePasswordScreen> {
  String oldPass = '';
  String newPass = '';
  bool isloading = false;
  bool oldpasswordmatch = true;

  final _formkey = GlobalKey<FormState>();

  void _submit() async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry1;
    overlayEntry1 = OverlayEntry(builder: (context) {
      return GeneralOverlayLoadingScreen('Verifying Old Password');
    });
    OverlayEntry overlayEntry2;
    overlayEntry2 = OverlayEntry(builder: (context) {
      return GeneralOverlayLoadingScreen('Updating Password');
    });

    //start loader
    overlayState.insert(overlayEntry1);

    oldpasswordmatch = await validatePassword(oldPass);
    print('bool updated!!');

    //stop loader
    overlayEntry1.remove();

    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

      //start loader
      overlayState.insert(overlayEntry2);

      try {
        await updatePassword(oldPass, newPass);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: colorschemeclass.primarygreen,
          content: Row(
            children: [
              Icon(Icons.check, color: colorschemeclass.lightgrey),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              Text('Password Updated Successfully')
            ],
          ),
        ));
      } catch (e) {
        print(e);
      }

      //stop loader
      overlayEntry2.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
        child: myAppBarWithBack('Update Password'),
      ),
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
                myTextEormField(
                    Icon(Icons.vpn_key),
                    'old password',
                    true,
                    (val) {
                      setState(() {
                        oldPass = val;
                      });
                    },
                    TextInputType.visiblePassword,
                    (oldpassword) {
                      return oldpasswordmatch
                          ? null
                          : 'Old password doesn\'t match';
                    }),
                myTextEormField(Icon(Icons.vpn_key), 'new password', true,
                    (val) {
                  setState(() {
                    newPass = val;
                  });
                },
                    TextInputType.visiblePassword,
                    (val) => val.trim().length < 6
                        ? 'Password must contain atleast 6 characters'
                        : null),
                myTextEormField(
                    Icon(Icons.vpn_key),
                    'confirm new password',
                    true,
                    (val) {},
                    TextInputType.visiblePassword,
                    (val) => val != newPass ? 'Password doesn\'t match' : null),
                Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height * 0.11,
                    child: myButton(colorschemeclass.primarygreen,
                        'Update Password', _submit))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
