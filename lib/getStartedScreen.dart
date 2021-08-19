import 'package:coderstatus/components/colorscheme.dart';
import 'package:coderstatus/components/myButtons.dart';
import 'package:coderstatus/signInScreen.dart';
import 'package:coderstatus/signUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: RiveAnimation.asset(
              'assets/boy-scene.riv',
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  width: double.infinity,
                  color: ColorSchemeClass.dark.withOpacity(0.5),
                  child: Column(
                    children: [
                      Hero(
                        tag: 'appIcon',
                        child: Image(
                          width: MediaQuery.of(context).size.width * 0.2,
                          image: AssetImage('images/appiconnoback.png'),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Spark up the Competition among your Competitive Programming peers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.05,
                          fontFamily: 'headline',
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      MyButton(ColorSchemeClass.primarygreen, 'Get Started',
                          () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpScreen();
                        }));
                      }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignInScreen();
                            }));
                          },
                          child: Text(
                            'Already have an account? Log in',
                            style: TextStyle(
                                color: ColorSchemeClass.lightgrey,
                                fontFamily: 'young',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                decoration: TextDecoration.underline),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
