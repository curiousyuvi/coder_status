import 'package:flutter/material.dart';
import 'colorscheme.dart';
import 'package:codersstatus/components/myChildListTile.dart';

class mySettingsNonExpansionTile extends StatelessWidget {
  Icon leadingIcon;
  String title;
  Color tilecolor;
  mySettingsNonExpansionTile(Icon leadingIcon, String title,
      [Color tilecolor = colorschemeclass.darkgrey]) {
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
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 0,
                          color: colorschemeclass.darkgrey.withOpacity(0.5),
                          offset: Offset(0, 6),
                          blurRadius: 10,
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
                                  MediaQuery.of(context).size.height * 0.03,
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
