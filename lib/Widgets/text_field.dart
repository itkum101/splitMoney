import 'package:flutter/material.dart';

class TextBoxSample extends StatelessWidget {
  TextBoxSample(
      {Key? key,
      this.prefixIcon,
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
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;
  final InputBorder? focusedBorder;
  final InputBorder? border;
  final TextEditingController? controller;
  void Function(String)? onchangedFunc;
  final Color? cursorColor;
  bool? isFilled;
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
          prefixIcon: prefixIcon,
          filled: isFilled,
          fillColor: Colors.grey[200],
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(color: Colors.grey[700]),
          border: border,
        ));
  }
}
