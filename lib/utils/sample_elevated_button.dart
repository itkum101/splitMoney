import 'package:flutter/material.dart';

class SampleElevatedButton extends StatelessWidget {
  final String buttonText;
  const SampleElevatedButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(10),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
      onPressed: () {},
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500),
      ),
    );
  }
}
