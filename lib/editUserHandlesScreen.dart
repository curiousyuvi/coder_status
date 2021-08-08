import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/generalLoadingScreen.dart';
import 'package:codersstatus/components/myAppBarWithBack.dart';
import 'package:codersstatus/components/showAnimatedToast.dart';
import 'package:codersstatus/components/myButton.dart';
import 'package:codersstatus/components/myTextFormField.dart';
import 'package:codersstatus/firebase_layer/getUserInfo.dart';
import 'package:codersstatus/firebase_layer/setUserInfo.dart';
import 'package:codersstatus/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class EditUserHandlesScreen extends StatefulWidget {
  @override
  _EditUserHandlesScreenState createState() => _EditUserHandlesScreenState();
}

class _EditUserHandlesScreenState extends State<EditUserHandlesScreen> {
  TextEditingController codeforcesEditingController;
  TextEditingController codechefEditingController;
  TextEditingController atcoderEditingController;
  TextEditingController spojEditingController;
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isFirstTime = true;

  readyUserData() async {
    final userHandles = await GetUserInfo.getUserHandles();
    codeforcesEditingController = TextEditingController(text: userHandles[0]);
    codechefEditingController = TextEditingController(text: userHandles[1]);
    atcoderEditingController = TextEditingController(text: userHandles[2]);
    spojEditingController = TextEditingController(text: userHandles[3]);
    setState(() {
      isFirstTime = false;
    });
  }

  void _submit() async {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      setState(() {
        isLoading = true;
      });

      await SetUserInfo.updateHandles(
          codeforcesEditingController.text.trim(),
          codechefEditingController.text.trim(),
          atcoderEditingController.text.trim(),
          spojEditingController.text.trim());

      Phoenix.rebirth(context);
    }
  }

  Future futureFunction;

  @override
  void initState() {
    super.initState();
    futureFunction = readyUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
          child: MyAppBarWithBack('Edit Profile'),
        ),
        backgroundColor: ColorSchemeClass.dark,
        body: isFirstTime
            ? FutureBuilder(
                future: futureFunction,
                builder: (context, snapshot) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
            : isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GestureDetector(
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    },
                    child: Scaffold(
                        backgroundColor: ColorSchemeClass.dark,
                        body: SafeArea(
                            child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.015),
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formkey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Text(
                                    '*If you don\'t want to add a particular platform you can leave that field empty.',
                                    style: TextStyle(
                                        color: ColorSchemeClass.lightgrey,
                                        fontFamily: 'young',
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      child: Row(
                                        children: [
                                          Image(
                                              image: AssetImage(
                                                  'images/codeforceswhitelogo.png'),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.15),
                                          Flexible(
                                            child: MyTextEormField(
                                                Icon(Icons.alternate_email),
                                                'codeforces_handle',
                                                false,
                                                (val) {},
                                                TextInputType.name,
                                                (val) => val
                                                        .trim()
                                                        .toString()
                                                        .contains(' ')
                                                    ? 'User handle should\'nt contain spaces'
                                                    : null,
                                                codeforcesEditingController),
                                          )
                                        ],
                                      )),
                                  Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      child: Row(
                                        children: [
                                          Image(
                                              image: AssetImage(
                                                  'images/codechefwhitelogo.png'),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.15),
                                          Flexible(
                                            child: MyTextEormField(
                                                Icon(Icons.alternate_email),
                                                'codechef_handle',
                                                false,
                                                (val) {},
                                                TextInputType.name,
                                                (val) => val
                                                        .trim()
                                                        .toString()
                                                        .contains(' ')
                                                    ? 'User handle should\'nt contain spaces'
                                                    : null,
                                                codechefEditingController),
                                          )
                                        ],
                                      )),
                                  Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      child: Row(
                                        children: [
                                          Image(
                                              image: AssetImage(
                                                  'images/atcoderwhitelogo.png'),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.15),
                                          Flexible(
                                            child: MyTextEormField(
                                                Icon(Icons.alternate_email),
                                                'atcoder_handle',
                                                false,
                                                (val) {},
                                                TextInputType.name,
                                                (val) => val
                                                        .trim()
                                                        .toString()
                                                        .contains(' ')
                                                    ? 'User handle should\'nt contain spaces'
                                                    : null,
                                                atcoderEditingController),
                                          )
                                        ],
                                      )),
                                  Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      child: Row(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                'images/spojwhitelogo.png'),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                          ),
                                          Flexible(
                                            child: MyTextEormField(
                                                Icon(Icons.alternate_email),
                                                'spoj_handle',
                                                false,
                                                (val) {},
                                                TextInputType.name,
                                                (val) => val
                                                        .trim()
                                                        .toString()
                                                        .contains(' ')
                                                    ? 'User handle should\'nt contain spaces'
                                                    : null,
                                                spojEditingController),
                                          )
                                        ],
                                      )),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    height: MediaQuery.of(context).size.height *
                                        0.09,
                                    child: MyButton(
                                        ColorSchemeClass.primarygreen,
                                        'Update User Handles',
                                        _submit),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))),
                  ));
  }
}
