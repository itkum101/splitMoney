import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  TextBox(
      {Key? key,
      this.hintText,
      required this.isautoFocus,
      this.border,
      this.cursorHeight,
      this.labelText,
      this.focusedBorder,
      this.controller,
      this.cursorColor,
      this.isFilled,
      this.onchangedFunc})
      : super(key: key);
  final String? hintText;
  final String? labelText;
  final InputBorder? focusedBorder;
  final InputBorder? border;
  final TextEditingController? controller;
  void Function(String)? onchangedFunc;
  final Color? cursorColor;
  bool? isFilled = true;
  bool isautoFocus;
  double? cursorHeight;

  @override
  Widget build(BuildContext context) {
    return TextField(
        autofocus: isautoFocus,
        cursorColor: cursorColor,
        cursorHeight: cursorHeight,
        onChanged: onchangedFunc,
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: focusedBorder,
          filled: isFilled,
          fillColor: Colors.grey[200],
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(color: Colors.grey[700]),
          border: border,
        ));
  }
}
