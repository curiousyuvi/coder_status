import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coder_status/components/generalLoader.dart';
import 'package:coder_status/screens/registerCodernameScreen.dart';
import 'package:coder_status/screens/registerEmailidScreen.dart';
import 'package:coder_status/screens/signInScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../components/colorscheme.dart';
import '../components/showAnimatedToast.dart';
import '../firebase_layer/googleSignInProvider.dart';
import '../home.dart';
import '../components/noInternet.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;
  StreamSubscription subscription;

  @override
  initState() {
    super.initState();

    subscription = InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;

      if (!hasInternet) noInternet(this.context);
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Hero(
                      tag: 'appIcon',
                      child: Image(
                        width: MediaQuery.of(context).size.width * 0.5,
                        image: AssetImage('images/appiconnoback.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'headline',
                            fontSize:
                                MediaQuery.of(context).size.height * 0.06),
                        children: [
                          TextSpan(
                            text: 'CODER',
                          ),
                          TextSpan(
                              text: ' STATUS',
                              style: TextStyle(
                                  color: ColorSchemeClass.primarygreen))
                        ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final provider = Provider.of<GoogleSigInProvider>(context,
                          listen: false);

                      setState(() {
                        isLoading = true;
                      });
                      final user = await provider.googleLogin();

                      if (user == null) {
                        setState(() {
                          isLoading = false;
                        });
                        showAnimatedToast(
                            this.context, 'Something went wrong', false);
                      } else {
                        bool flag = false;
                        try {
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .get()
                              .then((doc) {
                            flag = doc.exists;
                          });
                        } catch (e) {
                          flag = false;
                        }

                        if (flag) {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return Home();
                          }), ModalRoute.withName('/home'));
                        } else {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return Registercodernamescreen(
                                user.displayName.toString().trim());
                          }), ModalRoute.withName('/registerCodername'));
                        }
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.07,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.15,
                          vertical: MediaQuery.of(context).size.width * 0.01),
                      decoration: BoxDecoration(
                          color: ColorSchemeClass.dangerred,
                          borderRadius: BorderRadius.circular(5)),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.08,
                            ),
                            Text(
                              'Sign Up With Google',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.055,
                                  fontFamily: 'young',
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RegisterEmailidScreen();
                      }));
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.07,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.15,
                          vertical: MediaQuery.of(context).size.width * 0.01),
                      decoration: BoxDecoration(
                          color: ColorSchemeClass.primarygreen,
                          borderRadius: BorderRadius.circular(5)),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidEnvelope,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.08,
                            ),
                            Text(
                              'Sign Up With Email',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.055,
                                  fontFamily: 'young',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Flexible(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignInScreen();
                          }));
                        },
                        child: Text(
                          'Already have an account?Sign In',
                          style: TextStyle(
                              color: ColorSchemeClass.lightgrey,
                              fontFamily: 'young',
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              decoration: TextDecoration.underline),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
        isLoading ? GeneralLoaderTransparent('') : SizedBox.shrink()
      ],
    );
  }
}
