import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InfoTextRow extends StatelessWidget {
  IconData? icon;
  final String infoText;
  InfoTextRow({super.key, this.icon, required this.infoText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey[700],
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              infoText,
              
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
