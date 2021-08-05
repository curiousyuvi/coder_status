import 'package:flutter/material.dart';
import 'colorscheme.dart';
import 'constants.dart';

class MyTextEormField extends StatelessWidget {
  Icon tficon;
  String tfhintText;
  bool isobscure;
  Function onchangedfunction;
  TextInputType textinputtype;
  Function validation;
  Color bordercolor;
  TextEditingController textEditingController;

  MyTextEormField(
      Icon tficon,
      String tfhintText,
      bool isobscure,
      Function onchangedfunction,
      TextInputType textinputtype,
      Function validation,
      [TextEditingController textEditingController = null,
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
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: MediaQuery.of(context).size.width * 0.02),
      child: TextFormField(
        cursorHeight: 17,
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
