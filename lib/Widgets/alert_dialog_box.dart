import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlertDialogBox extends StatelessWidget {
  final String alertText;
  const AlertDialogBox({super.key, required this.alertText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "ERROR!",
        style: TextStyle(color: Colors.red[500]),
      ),
      content: Text("Group Name Cannot Be Empty!"),
      actions: [
        MaterialButton(
          color: Colors.grey[300],
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("OK"),
        )
      ],
    );
    
  }
}
