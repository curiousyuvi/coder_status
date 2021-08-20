import 'package:CoderStatus/components/colorscheme.dart';
import 'package:CoderStatus/components/myAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PeersScreenSkeleton extends StatefulWidget {
  const PeersScreenSkeleton({Key key}) : super(key: key);

  @override
  _PeersScreenSkeletonState createState() => _PeersScreenSkeletonState();
}

class _PeersScreenSkeletonState extends State<PeersScreenSkeleton> {
  List<Widget> listOfUserTiles = List.filled(10, MyUserTileSkeleton());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: MyAppBar('Peers'),
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
      ),
      body: ListView(
        children: listOfUserTiles,
      ),
    );
  }
}

class MyUserTileSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
          vertical: MediaQuery.of(context).size.width * 0.01),
      child: ListTile(
        title: Container(
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
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.height * 0.08,
                    child: RiveAnimation.asset(
                      'assets/skeleton-place-holder.riv',
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      name,
                      style: TextStyle(
                          color: ColorSchemeClass.lightgrey,
                          fontFamily: 'young',
                          fontWeight: FontWeight.bold,
                          fontSize:
                              MediaQuery.of(context).size.height * 0.025),
                    ),
                  ),*/
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.025,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: RiveAnimation.asset(
                          'assets/skeleton-place-holder.riv',
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  /*FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '@' + codername,
                      style: TextStyle(
                          color: ColorSchemeClass.lightgrey.withOpacity(0.6),
                          fontFamily: 'young',
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    ),
                  )*/
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.02,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: RiveAnimation.asset(
                          'assets/skeleton-place-holder.riv',
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
