import 'package:codersstatus/components/topThreeRankingCard.dart';
import 'package:codersstatus/components/urls.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            TopThreeRankingCard(
                Urls.avatar4url,
                Urls.avatar2url,
                Urls.avatar3url,
                'curiousyuvi',
                'rosekamallove',
                'anupRaj',
                '1602',
                '1556',
                '1448')
          ],
        ),
      ),
    );
  }
}
