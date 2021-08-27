import 'package:flutter/material.dart';
import 'colorscheme.dart';
import 'constants.dart';

//ignore: must_be_immutable
class MyTextFormField extends StatelessWidget {
  Icon tficon;
  String tfhintText;
  bool isobscure;
  Function onchangedfunction;
  TextInputType textinputtype;
  Function validation;
  Color bordercolor;
  TextEditingController textEditingController;

  MyTextFormField(
      Icon tficon,
      String tfhintText,
      bool isobscure,
      Function onchangedfunction,
      TextInputType textinputtype,
      Function validation,
      [TextEditingController textEditingController,
      Color bordercolor = ColorSchemeClass.primarygreen]) {
    this.tficon = tficon;
    this.tfhintText = tfhintText;
    this.isobscure = isobscure;
    this.onchangedfunction = onchangedfunction;
    this.textinputtype = textinputtype;
    this.validation = validation;
    this.bordercolor = bordercolor;
    this.textEditingController = textEditingController;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.02,
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        controller: textEditingController,
        validator: validation,
        onChanged: onchangedfunction,
        keyboardType: textinputtype,
        cursorColor: bordercolor,
        obscureText: isobscure,
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'young',
            fontSize: 17,
            fontWeight: FontWeight.normal),
        decoration: myInputDecoration.copyWith(
          hintText: tfhintText,
          prefixIcon: tficon,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: bordercolor, width: 2)),
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class MyPassageTextEormField extends StatelessWidget {
  String tfhintText;
  Function onchangedfunction;
  Function validation;
  Color bordercolor;
  TextEditingController textEditingController;

  MyPassageTextEormField(
    String tfhintText,
    Function onchangedfunction,
    Function validation, [
    TextEditingController textEditingController,
    Color bordercolor = ColorSchemeClass.primarygreen,
  ]) {
    this.tfhintText = tfhintText;
    this.onchangedfunction = onchangedfunction;
    this.validation = validation;
    this.bordercolor = bordercolor;
    this.textEditingController = textEditingController;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.02,
      ),
      child: TextFormField(
        controller: textEditingController,
        maxLines: null,
        validator: validation,
        onChanged: onchangedfunction,
        keyboardType: TextInputType.multiline,
        cursorColor: bordercolor,
        obscureText: false,
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'young',
            fontSize: 17,
            fontWeight: FontWeight.normal),
        decoration: myPassageInputDecoration.copyWith(
          hintText: tfhintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: bordercolor, width: 2)),
        ),
      ),
    );
  }
}
