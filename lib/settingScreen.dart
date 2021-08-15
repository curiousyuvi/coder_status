import 'package:codersstatus/aboutDeveloperScreen.dart';
import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/confirmationDialog.dart';
import 'package:codersstatus/components/generalLoader.dart';
import 'package:codersstatus/components/myAppBar.dart';
import 'package:codersstatus/components/mySettingNonExpansionTile.dart';
import 'package:codersstatus/components/mySettingsExpansionTile.dart';
import 'package:codersstatus/components/myChildListTile.dart';
import 'package:codersstatus/deleteAccountScreen.dart';
import 'package:codersstatus/editProfileScreen.dart';
import 'package:codersstatus/firebase_layer/deleteUser.dart';
import 'package:codersstatus/firebase_layer/logoutUser.dart';
import 'package:codersstatus/updatePasswordScreen.dart';
import 'package:codersstatus/editUserHandlesScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                            FontAwesomeIcons.solidEdit,
                            color: ColorSchemeClass.lightgrey,
                          ),
                          'Edit Profile'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return EditUserHandlesScreen();
                        }));
                      },
                      child: MySettingsNonExpansionTile(
                          Icon(
                            FontAwesomeIcons.thLarge,
                            color: ColorSchemeClass.lightgrey,
                          ),
                          'User Handles'),
                    ),
                    MySettingsExpansionTile(
                      Icon(FontAwesomeIcons.userLock),
                      'Account & Security',
                      [
                        FirebaseAuth.instance.currentUser.photoURL == null
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return UpdatePasswordScreen();
                                  }));
                                },
                                child: MyChildListTile(
                                    Icon(
                                      FontAwesomeIcons.key,
                                      color: ColorSchemeClass.dark,
                                    ),
                                    'Change Password'),
                              )
                            : MyChildListTile(
                                Icon(
                                  FontAwesomeIcons.key,
                                  color: ColorSchemeClass.unactivatedblack
                                      .withOpacity(0.2),
                                ),
                                'Change Password',
                                ColorSchemeClass.unactivatedblack
                                    .withOpacity(0.2)),
                        GestureDetector(
                          onTap: () {
                            if (FirebaseAuth.instance.currentUser.photoURL ==
                                null) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DeleteAccountScreen();
                              }));
                            } else {
                              showConfirmationDialog(
                                  this.context,
                                  'Delete Account',
                                  'If you continue, your account will be permanently deleted and all your account\'s data will be lost.\nDo you wish to continue',
                                  () async {
                                setState(() {
                                  isLoading = true;
                                });
                                await deleteUser();
                                await GoogleSignIn().disconnect();
                                await logout(context);
                                Phoenix.rebirth(context);
                              }, false, FontAwesomeIcons.exclamationTriangle);
                            }
                          },
                          child: MyChildListTile(
                              Icon(
                                FontAwesomeIcons.trash,
                                color: ColorSchemeClass.dangerred,
                              ),
                              'Delete Account',
                              ColorSchemeClass.dangerred),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AboutDeveloperScreen();
                        }));
                      },
                      child: MySettingsNonExpansionTile(
                          Icon(
                            FontAwesomeIcons.info,
                            color: ColorSchemeClass.lightgrey,
                          ),
                          'About Developer'),
                    ),
                    GestureDetector(
                      onTap: () {
                        logout(context);
                      },
                      child: MySettingsNonExpansionTile(
                          Icon(
                            FontAwesomeIcons.signOutAlt,
                            color: ColorSchemeClass.lightgrey,
                          ),
                          'Log Out',
                          ColorSchemeClass.dangerred,
                          ColorSchemeClass.dangerred),
                    ),
                  ]),
                ),
              ),
            )),
        isLoading ? GeneralLoaderTransparent('') : SizedBox.shrink()
      ],
    );
  }
}
