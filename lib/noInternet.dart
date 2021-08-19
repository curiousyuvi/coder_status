import 'package:coderstatus/components/colorscheme.dart';
import 'package:coderstatus/components/myButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rive/rive.dart';

NoInternet(BuildContext context) {
  OverlayState overlayState = Overlay.of(context);
  OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(builder: (context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                child: RiveAnimation.asset(
                  'assets/cup-crying.riv',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Icon(
                    Icons.wifi_off,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.height * 0.08,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'No Internet',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'young',
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.05),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      'Please connect to Internet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontFamily: 'young',
                          fontSize: MediaQuery.of(context).size.height * 0.025),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Flexible(
              child: Container(
                width: MediaQuery.of(context).size.height * 0.5,
                child: MyButton(ColorSchemeClass.primarygreen, 'Try Again', () {
                  Phoenix.rebirth(context);
                }, Icons.refresh),
              ),
            )
          ],
        ),
      ),
    );
  });

  overlayState.insert(overlayEntry);

  InternetConnectionChecker().onStatusChange.listen((status) {
    final hasInternet = status == InternetConnectionStatus.connected;
    if (!hasInternet) Phoenix.rebirth(context);
  });
}
