import 'package:codersstatus/viewAnotherUserScreen.dart';
import 'package:flutter/material.dart';
import 'colorscheme.dart';

class MyUserTile extends StatelessWidget {
  String uid, avatarUrl, name, codername;
  MyUserTile(this.uid, this.avatarUrl, this.name, this.codername);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ViewAnotherUserScreen(uid);
          }));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
              color: ColorSchemeClass.unactivatedblack,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                    color: ColorSchemeClass.darkgrey.withOpacity(0.3),
                    offset: Offset(
                      0,
                      MediaQuery.of(context).size.height * 0.005,
                    ),
                    blurRadius: 0,
                    spreadRadius: 0)
              ]),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
                radius: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: ColorSchemeClass.lightgrey,
                        fontFamily: 'young',
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.03),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    '@' + codername,
                    style: TextStyle(
                        color: ColorSchemeClass.lightgrey.withOpacity(0.6),
                        fontFamily: 'young',
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
