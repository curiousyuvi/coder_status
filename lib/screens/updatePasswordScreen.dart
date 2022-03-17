import 'package:coder_status/components/colorscheme.dart';
import 'package:coder_status/components/confirmationDialog.dart';
import 'package:coder_status/components/showAnimatedToast.dart';
import 'package:coder_status/firebase_layer/updatePassword.dart';
import 'package:coder_status/firebase_layer/validatePassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/generalLoader.dart';
import '../components/myAppBar.dart';
import '../components/myTextFormFields.dart';
import '../components/myButtons.dart';

class UpdatePasswordScreen extends StatefulWidget {
  @override
  _UpdatePasswordScreenState createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  String oldPass = '';
  String newPass = '';
  bool isLoading = false;
  bool oldpasswordmatch = true;

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

    oldpasswordmatch = await validatePassword(oldPass);

    //stop loader
    setState(() {
      isLoading = false;
    });

    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      //start loader
      setState(() {
        isLoading = true;
      });

      try {
        await updatePassword(oldPass, newPass);
        //Toast
        showAnimatedToast(this.context, 'Password Updated Successfully.', true);
        Navigator.pop(context);
      } catch (e) {}

      //stop loader
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
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
              child: MyAppBarWithBack('Update Password'),
            ),
            backgroundColor: ColorSchemeClass.dark,
            body: SafeArea(
              child: Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        child: Text(
                            'Use a combination of letters, digits and special characters',
                            style: TextStyle(
                                color: ColorSchemeClass.darkgrey,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.022,
                                fontFamily: 'young'),
                            textAlign: TextAlign.center),
                      )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      MyTextFormField(
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      MyTextFormField(Icon(Icons.vpn_key), 'new password', true,
                          (val) {
                        setState(() {
                          newPass = val;
                        });
                      },
                          TextInputType.visiblePassword,
                          (val) => val!.trim().length < 6
                              ? 'Password must contain atleast 6 characters'
                              : null),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      MyTextFormField(
                          Icon(Icons.vpn_key),
                          'confirm new password',
                          true,
                          (val) {},
                          TextInputType.visiblePassword,
                          (val) => val != newPass
                              ? 'Password doesn\'t match'
                              : null),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01),
                          height: MediaQuery.of(context).size.height * 0.09,
                          child: MyButton(
                            ColorSchemeClass.primarygreen,
                            'Update Password',
                            () {
                              showConfirmationDialog(
                                  this.context,
                                  'CONFIRM PASSWORD CHANGE',
                                  'If you accept your account pssword will be changed. Do you want to continue?',
                                  () {
                                _submit();
                              }, true, FontAwesomeIcons.key);
                            },
                          )),
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
