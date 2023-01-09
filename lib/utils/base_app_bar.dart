import 'package:flutter/material.dart';
import 'package:splitmoney/routes/Groups/add_group.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final Text? title;
  final AppBar appBar;
  final List<Widget>? widgets;

  /// you can add more fields that meet your needs

  const BaseAppBar({super.key, this.title, required this.appBar, this.widgets});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              size: 23,
              color: Colors.grey[800],
            )),
        const SizedBox(
          width: 7,
        ),
        IconButton(
            splashRadius: 20,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return AddGroup();
              })));
            },
            icon: Icon(
              Icons.group_add_sharp,
              size: 23,
              color: Colors.grey[800],
            )),
        const SizedBox(
          width: 17,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
