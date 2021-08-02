import 'package:codersstatus/components/myButton.dart';
import 'package:codersstatus/firebase_layer/validatePassword.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  String oldPassword = '';

  void _submit() async {
    final flag = await validatePassword(oldPassword);
    if (flag)
      print('Password match!');
    else
      print("Password doen't match!!");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Material(
              child: TextField(
                onChanged: (val) {
                  oldPassword = val;
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            MyButton(Colors.green, 'Submit', () {
              _submit();
            })
          ],
        ),
      ),
    );
  }
}
