import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          const SizedBox(
            height: 50,
          ),
          const SizedBox(
            width: 50,
          ),
          const Icon(
            Icons.person,
          ),
          const SizedBox(
            width: 50,
          ),
          Column(
            children: const [
              Text(
                "FETCHED NAME",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              // Later we will display first 15 or 20 characters in text style
              Text(
                "amrit@splitMoney.com",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          const Icon(
            Icons.edit,
          ),
        ],
      ),
    );
  }
}
