import 'package:flutter/material.dart';

class AlertDialogBox extends StatelessWidget {
  final String alertText;
  const AlertDialogBox({super.key, required this.alertText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      // title: Center(
      //   child: Text(
      //     "ERROR!",
      //     style: TextStyle(color: Colors.red[400]),
      //   ),
      // ),
      content: Text(
        alertText,
        style: TextStyle(
            color: Colors.grey[700], fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
