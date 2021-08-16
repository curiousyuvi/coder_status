import 'package:flutter/material.dart';
import 'colorscheme.dart';
import 'package:coderstatus/components/myChildListTile.dart';

class MySettingsNonExpansionTile extends StatelessWidget {
  Icon leadingIcon;
  String title;
  Color tilecolor;
  Color extrusioncolor;
  MySettingsNonExpansionTile(Icon leadingIcon, String title,
      [Color tilecolor = ColorSchemeClass.unactivatedblack,
      Color extrusioncolor = ColorSchemeClass.darkgrey]) {
    this.leadingIcon = leadingIcon;
    this.title = title;
    this.tilecolor = tilecolor;
    this.extrusioncolor = extrusioncolor;
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
                          color: extrusioncolor.withOpacity(0.5),
                          offset: Offset(0, 4),
                          blurRadius: 0,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: ListTile(
                        tileColor: tilecolor,
                        leading: leadingIcon,
                        title: Text(
                          title,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontWeight: FontWeight.bold),
                        ),
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
