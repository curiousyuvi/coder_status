import 'package:flutter/material.dart';
import 'colorscheme.dart';

//ignore: must_be_immutable
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

//ignore: must_be_immutable
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

//ignore: must_be_immutable
class MyChildListTile extends StatelessWidget {
  Icon leadingicon;
  String title;
  Color fontcolor;
  MyChildListTile(Icon leadingicon, String title,
      [Color fontcolor = ColorSchemeClass.dark]) {
    this.leadingicon = leadingicon;
    this.title = title;
    this.fontcolor = fontcolor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: ListTile(
        tileColor: ColorSchemeClass.lightgrey,
        leading: leadingicon,
        title: Text(
          title,
          style: TextStyle(
              color: fontcolor,
              fontSize: MediaQuery.of(context).size.height * 0.02,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
