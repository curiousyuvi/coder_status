import 'package:codersstatus/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class coderbadgewidgetclass {
  bool a = false;

  static Widget getcoderbadge(AssetImage coderbadge1, AssetImage coderbadge2) {
    AssetImage coderbadge = coderbadge1;
    return GestureDetector(
      onTap: () async {



      },
      child: Container(
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: coderbadge),
        ),
      ),
    );
  }
}
