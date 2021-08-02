import 'package:flutter/material.dart';
import 'colorscheme.dart';
import 'constants.dart';

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
    TextEditingController textEditingController = null,
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
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: TextFormField(
        controller: textEditingController,
        maxLines: null,
        validator: validation,
        onChanged: onchangedfunction,
        keyboardType: TextInputType.name,
        cursorColor: bordercolor,
        obscureText: false,
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'young',
            fontSize: 15,
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
