import 'package:flutter/material.dart';
import 'colorscheme.dart';

InputDecoration myInputDecoration = InputDecoration(
    fillColor: colorschemeclass.darkgrey,
    filled: true,
    prefixIcon: Icon(
      Icons.transit_enterexit,
      color: colorschemeclass.lightgrey,
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: colorschemeclass.primarygreen, width: 2)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.red, width: 1)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.red, width: 2)),
    hintText: 'Enter a value',
    hintStyle: TextStyle(color: colorschemeclass.unactivatedblack));
