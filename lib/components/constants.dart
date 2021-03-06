import 'package:flutter/material.dart';
import 'colorscheme.dart';

InputDecoration myInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(5),
    fillColor: ColorSchemeClass.darkgrey,
    filled: true,
    prefixIcon: Icon(
      Icons.transit_enterexit,
      color: ColorSchemeClass.lightgrey,
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: ColorSchemeClass.primarygreen, width: 2)),
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
    hintStyle:
        TextStyle(color: ColorSchemeClass.unactivatedblack, fontSize: 17));

InputDecoration myPassageInputDecoration = InputDecoration(
    fillColor: ColorSchemeClass.darkgrey,
    filled: true,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: ColorSchemeClass.primarygreen, width: 2)),
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
    hintStyle:
        TextStyle(color: ColorSchemeClass.unactivatedblack, fontSize: 17));
