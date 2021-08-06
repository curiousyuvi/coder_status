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
