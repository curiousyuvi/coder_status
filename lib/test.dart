import 'package:codersstatus/components/generalLoader.dart';
import 'package:flutter/material.dart';

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
    return GeneralLoader('Loading...');
  }
}
