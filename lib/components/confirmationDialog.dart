import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myButton.dart';
import 'package:codersstatus/components/myOutlineButton.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

bool showConfirmationDialog(BuildContext context, String title, String message,
    [Widget displayWidget = const SizedBox()]) {
  OverlayState overlayState = Overlay.of(context);

  OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(builder: (context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        child: Center(
          child: GlassContainer(
            borderRadius: BorderRadius.circular(5),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        onTap: () {
                          overlayEntry.remove();
                          return false;
                        },
                        child: Icon(
                          Icons.close,
                          color: ColorSchemeClass.darkgrey,
                          size: MediaQuery.of(context).size.height * 0.03,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorSchemeClass.lightgrey,
                          fontSize: MediaQuery.of(context).size.height * 0.05,
                          fontFamily: 'young',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: displayWidget),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorSchemeClass.lightgrey,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontFamily: 'young'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: MyOutlineButton(
                              ColorSchemeClass.lightgrey,
                              'No',
                              () {
                                overlayEntry.remove();
                                return false;
                              },
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: MyButton(
                              ColorSchemeClass.primarygreen,
                              'Yes',
                              () {
                                overlayEntry.remove();
                                return true;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  });

  overlayState.insert(overlayEntry);
}
