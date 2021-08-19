import 'package:coderstatus/components/colorscheme.dart';
import 'package:coderstatus/components/confirmationDialog.dart';
import 'package:coderstatus/components/generalLoader.dart';
import 'package:coderstatus/firebase_layer/deleteUser.dart';
import 'package:coderstatus/firebase_layer/logoutUser.dart';
import 'package:coderstatus/firebase_layer/validatePassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart' as gradient;
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/myAppBar.dart';
import 'components/myTextFormFields.dart';
import 'components/myButtons.dart';

class DeleteAccountScreen extends StatefulWidget {
  @override
  _DeleteAccountScreenState createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  String password = '';
  bool passwordmatch = false;
  bool isLoading = false;

  final _formkey = GlobalKey<FormState>();

  void _submit() async {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    //start loader
    setState(() {
      isLoading = true;
    });

    passwordmatch = await validatePassword(password);

    //stop loader
    setState(() {
      isLoading = false;
    });

    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

      //start loader
      setState(() {
        isLoading = true;
      });
      try {
        await deleteUser(password);
        await logout(context);
        Phoenix.rebirth(context);
      } catch (e) {}

      //end loader
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            backgroundColor: ColorSchemeClass.dark,
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
              child: MyAppBarWithBack('Delete Account'),
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
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.04),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: gradient.LinearGradient(stops: [
                              0.0,
                              0.5,
                            ], colors: [
                              ColorSchemeClass.morphdangerred,
                              ColorSchemeClass.unactivatedblack,
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
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ColorSchemeClass.dangerred),
                                        child: Icon(Icons.priority_high)),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.06,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Account Delete Alert',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: ColorSchemeClass.dangerred,
                                              fontFamily: 'young',
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          child: FittedBox(
                                            alignment: Alignment.centerLeft,
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              'If you continue further your account\nwill be deleted permanentally and\n all your account\'s data will be lost.\nYou will have to create a new\naccount from scratch',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: ColorSchemeClass
                                                      .lightgrey,
                                                  fontFamily: 'young',
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.02),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        ),
                      )),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Theme(
                        data: ThemeData(
                            accentColor: ColorSchemeClass.dangerred,
                            primaryColor: ColorSchemeClass.dangerred),
                        child: MyTextFormField(
                            Icon(Icons.vpn_key),
                            'Enter Password',
                            true,
                            (val) {
                              password = val;
                            },
                            TextInputType.visiblePassword,
                            (password) {
                              return passwordmatch
                                  ? null
                                  : 'Password is incorrect';
                            },
                            null,
                            ColorSchemeClass.dangerred),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03,
                            vertical:
                                MediaQuery.of(context).size.height * 0.01),
                        height: MediaQuery.of(context).size.height * 0.09,
                        child: MyButton(
                            ColorSchemeClass.dangerred, 'Delete Account', () {
                          showConfirmationDialog(
                              this.context,
                              'CONFIRM ACCOUNT DELETION',
                              'If you accept your account will be deleted permanently. Do you want to continue?',
                              () {
                            _submit();
                          }, false, FontAwesomeIcons.trash);
                        }, Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        isLoading ? GeneralLoaderTransparent('') : SizedBox.shrink()
      ],
    );
  }
}
