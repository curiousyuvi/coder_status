import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coder_status/components/colorscheme.dart';
import 'package:coder_status/components/myAppBar.dart';
import 'package:coder_status/components/myTextFormFields.dart';
import 'package:coder_status/components/myUserTile.dart';
import 'package:coder_status/firebase_layer/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //To store the list of users queried from firestore by using search key
  var queryResultSet = [];

  //List of User Tiles to be displayed
  List<Widget> listOfUserTiles = [];

  //***************************************************************************/
  //*********************INSTANT SEARCH ALGORITHM******************************/
  //***************************************************************************/
  void initateSearch(String searchedValue) async {
    //if search field is empty then clear the queryResultSet and tempSearchStore
    if (searchedValue.length == 0) {
      setState(() {
        queryResultSet = [];
        listOfUserTiles = [];
      });
    }

    /*the searched string is changed to uppercase and all spaces are removed*/
    var morphedValue = searchedValue.toUpperCase().replaceAll(' ', '');

    /*when the user enters the first character queryResultSet gets populated by 
    the document of users with matching search key as the entered charachter*/
    if (queryResultSet.length == 0 && searchedValue.length == 1) {
      QuerySnapshot querySnapshot =
          await SearchDatabase().searchByKey(morphedValue);
      querySnapshot.docs.forEach((element) {
        queryResultSet.add(element.data());
      });
    }

    /*when the user enters more charachter then the document from queryResultSet
     whose name and username starts with capitalizedValue is parsed and a 
     MyUserTile widget of the user is added to listOfUserTiles*/
    else {
      setState(() {
        listOfUserTiles = [];
        queryResultSet.forEach((element) {
          if (element['name']
                  .toString()
                  .toUpperCase()
                  .replaceAll(' ', '')
                  .startsWith(morphedValue) ||
              element['codername']
                  .toString()
                  .toUpperCase()
                  .replaceAll(' ', '')
                  .startsWith(morphedValue)) {
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
              listOfUserTiles.length == 0
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
                  : Expanded(child: ListView(children: listOfUserTiles))
            ],
          ),
        )),
      ),
    );
  }
}
