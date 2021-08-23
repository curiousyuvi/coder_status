import 'package:coder_status/components/colorscheme.dart';
import 'package:coder_status/components/myButtons.dart';
import 'package:flutter/material.dart';

showConfirmationDialog(BuildContext context, String title, String message,
    Function toDoIfConfirmed, bool alertType,
    [IconData displayIcon = Icons.done]) async {
  return await showDialog<bool>(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Scaffold(
            backgroundColor: ColorSchemeClass.dark.withOpacity(0.5),
            body: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.15),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: alertType
                            ? ColorSchemeClass.primarygreen
                            : ColorSchemeClass.dangerred,
                        borderRadius: BorderRadius.circular(10)),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.04),
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
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white.withOpacity(0.5),
                                  size:
                                      MediaQuery.of(context).size.height * 0.03,
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
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.05,
                                    fontFamily: 'young',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Icon(
                            displayIcon,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.height * 0.1,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            message,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025,
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: MyOutlineButton(
                                      Colors.white,
                                      'No',
                                      () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: MyButton(Colors.white, 'Yes', () {
                                      toDoIfConfirmed();
                                      Navigator.of(context).pop();
                                    },
                                        null,
                                        alertType
                                            ? ColorSchemeClass.primarygreen
                                            : ColorSchemeClass.dangerred),
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
            ),
          ),
        );
      });
}
