import 'package:flutter/material.dart';

class SampleElevatedButton extends StatelessWidget {
  final String buttonText;
  void Function()? onPressed;
   SampleElevatedButton({super.key, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(width: 1, color: Colors.grey.shade400),
              ),
            ),
            shadowColor: MaterialStateProperty.all<Color>(Colors.black),
            elevation: MaterialStateProperty.all(3),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.grey.shade700,
              letterSpacing: 0.8,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
