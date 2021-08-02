import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myAppBar.dart';
import 'package:codersstatus/components/mySettingNonExpansionTile.dart';
import 'package:codersstatus/components/mySettingsExpansionTile.dart';
import 'package:codersstatus/components/myChildListTile.dart';
import 'package:codersstatus/deleteAccountScreen.dart';
import 'package:codersstatus/editProfileScreen.dart';
import 'package:codersstatus/firebase_layer/logoutUser.dart';
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
          child: MyAppBar('Settings'),
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EditProfileScreen();
                    }));
                  },
                  child: MySettingsNonExpansionTile(
                      Icon(
                        Icons.edit,
                        color: ColorSchemeClass.lightgrey,
                      ),
                      'Edit Profile'),
                ),
                MySettingsNonExpansionTile(
                    Icon(
                      Icons.dashboard,
                      color: ColorSchemeClass.lightgrey,
                    ),
                    'User Handles'),
                MySettingsExpansionTile(
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
                      child: MyChildListTile(
                          Icon(
                            Icons.lock,
                            color: ColorSchemeClass.dark,
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
                      child: MyChildListTile(
                          Icon(
                            Icons.delete,
                            color: ColorSchemeClass.dangerred,
                          ),
                          'Delete Account',
                          ColorSchemeClass.dangerred),
                    ),
                  ],
                ),
                MySettingsNonExpansionTile(
                    Icon(
                      Icons.info,
                      color: ColorSchemeClass.lightgrey,
                    ),
                    'About Developer'),
                GestureDetector(
                  onTap: () {
                    logout(context);
                  },
                  child: MySettingsNonExpansionTile(
                      Icon(
                        Icons.logout,
                        color: ColorSchemeClass.lightgrey,
                      ),
                      'Log Out',
                      ColorSchemeClass.dangerred,
                      ColorSchemeClass.dangerred),
                ),
              ]),
            ),
          ),
        ));
  }
}
