import 'package:flutter/material.dart';
import 'colorscheme.dart';

//Add this as parent to myAppBar :
//PreferredSize( preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.12),

class myAppBar extends StatelessWidget {
  String title;
  myAppBar(String title) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        width: double.infinity,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('images/appiconnoback.png'),
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(title,
                      style: TextStyle(
                          color: colorschemeclass.lightgrey,
                          fontFamily: 'young',
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.04)),
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: colorschemeclass.dark,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child:
            Icon(Icons.arrow_back_ios_sharp, color: colorschemeclass.lightgrey),
      ),
    );
  }
}
