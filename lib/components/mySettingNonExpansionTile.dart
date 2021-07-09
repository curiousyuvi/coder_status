import 'package:flutter/material.dart';
import 'colorscheme.dart';
import 'package:codersstatus/components/myChildListTile.dart';

class mySettingsNonExpansionTile extends StatelessWidget {
  Icon leadingIcon;
  String title;
  Color tilecolor;
  mySettingsNonExpansionTile(Icon leadingIcon, String title,
      [Color tilecolor = colorschemeclass.unactivatedblack]) {
    this.leadingIcon = leadingIcon;
    this.title = title;
    this.tilecolor = tilecolor;
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
                      unselectedWidgetColor: colorschemeclass.lightgrey,
                      accentColor: colorschemeclass.dark,
                      fontFamily: 'young',
                      textTheme: TextTheme(
                          subtitle1:
                              TextStyle(color: colorschemeclass.lightgrey))),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 0,
                          color: colorschemeclass.lightgrey.withOpacity(0.3),
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
