import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myButton.dart';
import 'package:codersstatus/components/myTextFormField.dart';
import 'package:codersstatus/firebase_layer/setUserInfo.dart';
import 'package:codersstatus/homescreen.dart';
import 'package:flutter/material.dart';

class registerbadgesscreen extends StatefulWidget {
  const registerbadgesscreen({Key key}) : super(key: key);

  @override
  _registerbadgesscreenState createState() => _registerbadgesscreenState();
}

class _registerbadgesscreenState extends State<registerbadgesscreen> {
  String codeforces = null, codechef = null, atcoder = null, spoj = null;
  final _formkey = GlobalKey<FormState>();
  bool isloading = false;

  void _submit() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print(codeforces + " " + codechef + " " + atcoder + " " + spoj);
      setState(() {
        isloading = true;
      });
      await SetUserInfo.updateHandles(codeforces, codechef, atcoder, spoj);

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return homescreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorschemeclass.dark,
        body: SafeArea(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Image(
                    image: AssetImage('images/appiconnoback.png'),
                    height: MediaQuery.of(context).size.height * 0.12,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'Add Your User Handles',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'young',
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.045),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    '*If you are not on a particular platform you can leave that field empty.',
                    style: TextStyle(
                        color: colorschemeclass.lightgrey,
                        fontFamily: 'young',
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        children: [
                          Image(image: AssetImage('images/codeforcesnobc.png')),
                          Flexible(
                            child: myTextEormField(
                                Icon(Icons.alternate_email),
                                'codeforces_handle',
                                false,
                                (val) {},
                                TextInputType.name,
                                (val) => val.trim().toString().contains(' ')
                                    ? 'User handle should\'nt contain spaces'
                                    : null),
                          )
                        ],
                      )),
                  Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        children: [
                          Image(image: AssetImage('images/codechefnobc.png')),
                          Flexible(
                            child: myTextEormField(
                                Icon(Icons.alternate_email),
                                'codechef_handle',
                                false,
                                (val) {},
                                TextInputType.name,
                                (val) => val.trim().toString().contains(' ')
                                    ? 'User handle should\'nt contain spaces'
                                    : null),
                          )
                        ],
                      )),
                  Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        children: [
                          Image(image: AssetImage('images/atcodernobc.png')),
                          Flexible(
                            child: myTextEormField(
                                Icon(Icons.alternate_email),
                                'atcoder_handle',
                                false,
                                (val) {},
                                TextInputType.name,
                                (val) => val.trim().toString().contains(' ')
                                    ? 'User handle should\'nt contain spaces'
                                    : null),
                          )
                        ],
                      )),
                  Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        children: [
                          Image(image: AssetImage('images/spojnobc.png')),
                          Flexible(
                            child: myTextEormField(
                                Icon(Icons.alternate_email),
                                'spoj_handle',
                                false,
                                (val) {},
                                TextInputType.name,
                                (val) => val.trim().toString().contains(' ')
                                    ? 'User handle should\'nt contain spaces'
                                    : null),
                          )
                        ],
                      )),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: myButton(true, 'Submit', _submit),
                  )
                ],
              ),
            ),
          ),
        )));
  }
}