import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/confirmationDialog.dart';
import 'package:codersstatus/components/myButton.dart';
import 'package:codersstatus/registerEmailidScreen.dart';
import 'package:codersstatus/signinScreen.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(MaterialApp(home: TestScreen()));
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyButton(ColorSchemeClass.primarygreen, 'Show Dialog', () {
          showConfirmationDialog(
              this.context,
              'Dialog Example',
              'This a dialog example ,you may chosse between the given options.',
              RiveAnimation.asset(
                'assets/cup.riv',
                fit: BoxFit.contain,
              ));
        }),
      ),
    );
  }
}
