import 'package:flutter/material.dart';
import 'colorscheme.dart';
import 'package:coderstatus/components/myChildListTile.dart';

class MySettingsExpansionTile extends StatelessWidget {
  Icon leadingIcon;
  String title;
  List<Widget> children;
  MySettingsExpansionTile(
      Icon leadingIcon, String title, List<Widget> children) {
    this.leadingIcon = leadingIcon;
    this.title = title;
    this.children = children;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
          padding: EdgeInsets.all(4),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Theme(
                  data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      unselectedWidgetColor: ColorSchemeClass.lightgrey,
                      accentColor: ColorSchemeClass.dark,
                      fontFamily: 'young',
                      textTheme: TextTheme(
                          subtitle1:
                              TextStyle(color: ColorSchemeClass.lightgrey))),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 0,
                          color: ColorSchemeClass.darkgrey.withOpacity(0.5),
                          offset: Offset(0, 4),
                          blurRadius: 0,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: ExpansionTile(
                        collapsedBackgroundColor:
                            ColorSchemeClass.unactivatedblack,
                        backgroundColor: ColorSchemeClass.lightgrey,
                        leading: leadingIcon,
                        title: Text(
                          title,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontWeight: FontWeight.bold),
                        ),
                        children: children,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
