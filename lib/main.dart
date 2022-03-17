import 'dart:async';
import 'package:coder_status/components/colorscheme.dart';
import 'package:coder_status/firebase_layer/authenticate.dart';
import 'package:coder_status/firebase_layer/googleSignInProvider.dart';
import 'package:coder_status/components/noInternet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: cancel_subscriptions
  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;

      if (!hasInternet) noInternet(context);
    });
  }

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
