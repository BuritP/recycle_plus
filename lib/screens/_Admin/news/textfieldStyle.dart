import 'package:flutter/material.dart';
import '../../../../components/font.dart';

//TODO : TextField Normal
InputDecoration styleTextFieldNews(labelEZ, hintEZ) {
  return InputDecoration(
    isDense: true,
    hintText: hintEZ,
    labelText: labelEZ,
    labelStyle: Roboto20_B_green,
    contentPadding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
    enabledBorder: StyleBoder(Colors.black), //ก่อนกดพิมพ์
    focusedBorder: StyleBoder(Colors.black), //กดพิมพ์
    errorBorder: StyleBoder(Colors.red), //แจ้ง Error
    focusedErrorBorder: StyleBoder(Colors.red), //พิมพ์หลังแจ้ง Error
    floatingLabelBehavior: FloatingLabelBehavior.always,
  );
}

//================================================================================================
//TODO : ขอบเส้น ธรรมดา
OutlineInputBorder StyleBoder(colorsEZ) => OutlineInputBorder(
      borderSide: BorderSide(
        color: colorsEZ,
        width: 1,
      ),
    );
