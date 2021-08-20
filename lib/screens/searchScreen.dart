import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:CoderStatus/components/colorscheme.dart';
import 'package:CoderStatus/components/myAppBar.dart';
import 'package:CoderStatus/components/myTextFormFields.dart';
import 'package:CoderStatus/components/myUserTile.dart';
import 'package:CoderStatus/firebase_layer/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var queryResultSet = [];
  var tempSearchStore = [];
  List<Widget> listOfUserTiles = [];

  void initateSearch(String value) async {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue = value.toUpperCase().replaceAll(' ', '');

    if (queryResultSet.length == 0 && value.length == 1) {
      QuerySnapshot querySnapshot =
          await SearchDatabase().searchByName(capitalizedValue);
      queryResultSet = [];
      querySnapshot.docs.forEach((element) {
        queryResultSet.add(element.data());
      });
    } else {
      setState(() {
        tempSearchStore = [];
        listOfUserTiles = [];
        queryResultSet.forEach((element) {
          if (element['name']
                  .toString()
                  .toUpperCase()
                  .replaceAll(' ', '')
                  .startsWith(capitalizedValue) ||
              element['codername']
                  .toString()
                  .toUpperCase()
                  .replaceAll(' ', '')
                  .startsWith(capitalizedValue)) {
            tempSearchStore.add(element);
            listOfUserTiles.add(MyUserTile(element['id'], element['avatarurl'],
                element['name'], element['codername']));
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          child: MyAppBar('Search'),
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
        ),
        body: SafeArea(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              MyTextFormField(Icon(CupertinoIcons.search), 'Search', false,
                  (val) {
                initateSearch(val);
              }, TextInputType.name, (val) {}),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              tempSearchStore.length == 0
                  ? Flexible(
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.9,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: RiveAnimation.asset(
                                      'assets/search-user.riv'),
                                ),
                              ),
                              Text(
                                'Enter Name or Username to search',
                                style: TextStyle(
                                    color: ColorSchemeClass.lightgrey,
                                    fontFamily: 'young',
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(children: listOfUserTiles))
            ],
          ),
        )),
      ),
    );
  }
}
