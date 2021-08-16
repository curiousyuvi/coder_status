import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/firebase_layer/authenticate.dart';
import 'package:codersstatus/firebase_layer/googleSignInProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(Phoenix(child: myApp()));
}

class myApp extends StatelessWidget {
  myApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSigInProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              accentColor: ColorSchemeClass.primarygreen,
              primaryColor: ColorSchemeClass.primarygreen,
              scaffoldBackgroundColor: ColorSchemeClass.dark,
              textTheme: TextTheme(
                  bodyText1:
                      TextStyle(fontFamily: 'young', color: Colors.white),
                  headline1:
                      TextStyle(fontFamily: 'young', color: Colors.white))),
          home: Authenticate()),
    );
  }
}
