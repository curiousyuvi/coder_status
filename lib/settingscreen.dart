import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myAppBar.dart';
import 'package:codersstatus/components/mySettingNonExpansionTile.dart';
import 'package:codersstatus/components/mySettingsExpansionTile.dart';
import 'package:codersstatus/components/myChildListTile.dart';
import 'package:codersstatus/deleteAccountScreen.dart';
import 'package:codersstatus/firebase_layer/logoutuser.dart';
import 'package:codersstatus/updatePasswordScreen.dart';

import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
          child: myAppBar('Settings'),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                mySettingsExpansionTile(
                  Icon(
                    Icons.edit,
                  ),
                  'Edit Profile',
                  [
                    myChildListTile(
                        Icon(
                          Icons.image,
                          color: colorschemeclass.dark,
                        ),
                        'Change Avatar'),
                    myChildListTile(
                        Icon(
                          Icons.person,
                          color: colorschemeclass.dark,
                        ),
                        'Change Name'),
                    myChildListTile(
                        Icon(
                          Icons.alternate_email,
                          color: colorschemeclass.dark,
                        ),
                        'Change Codername'),
                  ],
                ),
                mySettingsNonExpansionTile(
                    Icon(
                      Icons.dashboard,
                      color: colorschemeclass.lightgrey,
                    ),
                    'User Handles'),
                mySettingsExpansionTile(
                  Icon(Icons.security),
                  'Account & Security',
                  [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return UpdatePasswordScreen();
                        }));
                      },
                      child: myChildListTile(
                          Icon(
                            Icons.lock,
                            color: colorschemeclass.dark,
                          ),
                          'Change Password'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DeleteAccountScreen();
                        }));
                      },
                      child: myChildListTile(
                          Icon(
                            Icons.delete,
                            color: colorschemeclass.dangerred,
                          ),
                          'Delete Account',
                          colorschemeclass.dangerred),
                    ),
                  ],
                ),
                mySettingsNonExpansionTile(
                    Icon(
                      Icons.info,
                      color: colorschemeclass.lightgrey,
                    ),
                    'About Developer'),
                GestureDetector(
                  onTap: () {
                    logout(context);
                  },
                  child: mySettingsNonExpansionTile(
                      Icon(
                        Icons.logout,
                        color: colorschemeclass.lightgrey,
                      ),
                      'Log Out',
                      colorschemeclass.dangerred,
                      colorschemeclass.dangerred),
                ),
              ]),
            ),
          ),
        ));
  }
}
