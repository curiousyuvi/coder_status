import 'package:codersstatus/components/colorscheme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showFToast(BuildContext mycontext, String headine, bool alert) {
  if (alert) {
    FToast myToast = FToast();
    myToast.init(mycontext);
    myToast.showToast(
        child: Container(
          width: MediaQuery.of(mycontext).size.width * 0.9,
          decoration: BoxDecoration(
              color: colorschemeclass.primarygreen.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    offset: Offset.fromDirection(
                        1.57, MediaQuery.of(mycontext).size.height * 0.008),
                    blurRadius: 5,
                    spreadRadius: 1)
              ]),
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(mycontext).size.height * 0.01,
              horizontal: MediaQuery.of(mycontext).size.width * 0.05),
          child: Row(
            children: [
              Icon(Icons.check_circle,
                  color: colorschemeclass.lightgrey,
                  size: MediaQuery.of(mycontext).size.height * 0.05),
              SizedBox(
                width: MediaQuery.of(mycontext).size.width * 0.06,
              ),
              Text(
                headine,
                style: TextStyle(
                    color: colorschemeclass.lightgrey,
                    fontFamily: 'young',
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(mycontext).size.height * 0.02),
              )
            ],
          ),
        ),
        gravity: ToastGravity.CENTER,
        toastDuration: Duration(seconds: 3),
        fadeDuration: 300);
  } else {
    FToast myToast = FToast();
    myToast.init(mycontext);
    myToast.showToast(
        child: Container(
          width: MediaQuery.of(mycontext).size.width * 0.9,
          decoration: BoxDecoration(
              color: colorschemeclass.dangerred.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    offset: Offset.fromDirection(
                        1.57, MediaQuery.of(mycontext).size.height * 0.008),
                    blurRadius: 5,
                    spreadRadius: 1)
              ]),
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(mycontext).size.height * 0.01,
              horizontal: MediaQuery.of(mycontext).size.width * 0.05),
          child: Row(
            children: [
              Icon(Icons.error,
                  color: colorschemeclass.lightgrey,
                  size: MediaQuery.of(mycontext).size.height * 0.05),
              SizedBox(
                width: MediaQuery.of(mycontext).size.width * 0.06,
              ),
              Text(
                headine,
                style: TextStyle(
                    color: colorschemeclass.lightgrey,
                    fontFamily: 'young',
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(mycontext).size.height * 0.02),
              )
            ],
          ),
        ),
        gravity: ToastGravity.CENTER,
        toastDuration: Duration(seconds: 3),
        fadeDuration: 300);
  }
}
