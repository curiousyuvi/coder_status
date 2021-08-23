import 'package:coder_status/components/colorscheme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showAnimatedToast(BuildContext context, String headline, bool alert) {
  FToast myToast = FToast();
  myToast.init(context);
  myToast.showToast(
      child: AnimatedToast(alert, context, headline),
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 3),
      fadeDuration: 700);
}

class AnimatedToast extends StatefulWidget {
  String headline = '';
  bool alert;
  Icon leadingIcon;
  Color toastColor;
  BuildContext context;
  AnimatedToast(bool alert, BuildContext context, String headline) {
    this.alert = alert;
    this.headline = headline;
    this.context = context;
  }

  @override
  _AnimatedToastState createState() =>
      _AnimatedToastState(alert, context, headline);
}

class _AnimatedToastState extends State<AnimatedToast> {
  String headline = '';
  bool alert;
  IconData leadingIcon;
  Color toastColor;
  double height;
  BuildContext context;
  double opacity;

  _AnimatedToastState(bool alert, BuildContext context, String headline) {
    this.context = context;
    this.alert = alert;
    this.opacity = 0.02;
    this.height = 0;
    this.headline = headline;
    if (alert) {
      leadingIcon = Icons.check_circle;
      toastColor = ColorSchemeClass.primarygreen;
    } else {
      leadingIcon = Icons.error;
      toastColor = ColorSchemeClass.dangerred;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        height = MediaQuery.of(context).size.height * 0.3;
        opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AnimatedOpacity(
          opacity: opacity,
          duration: Duration(milliseconds: 300),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: toastColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      offset: Offset.fromDirection(
                          1.57, MediaQuery.of(context).size.height * 0.008),
                      blurRadius: 5,
                      spreadRadius: 1)
                ]),
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Row(
              children: [
                Icon(leadingIcon,
                    color: ColorSchemeClass.lightgrey,
                    size: MediaQuery.of(context).size.height * 0.05),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.06,
                ),
                Flexible(
                  child: Text(
                    headline,
                    style: TextStyle(
                        color: ColorSchemeClass.lightgrey,
                        fontFamily: 'young',
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.018),
                  ),
                )
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: height,
          curve: Curves.decelerate,
        )
      ],
    );
  }
}
