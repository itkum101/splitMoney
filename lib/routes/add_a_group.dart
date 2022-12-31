import 'package:flutter/material.dart';

import 'package:splitmoney/Widgets/group_type_item.dart';
import 'package:splitmoney/utils/data.dart';

class AddGroup extends StatefulWidget {
  AddGroup({super.key});

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  final _controller = TextEditingController();
  late String groupName = _controller.text;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void showSheet() {
    showModalBottomSheet(
        context: context,
        builder: ((context) {
          return Container(
            color: Colors.grey[400],
            height: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[500],
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(10),
                            child: IconButton(
                                iconSize: 30,
                                onPressed: () {},
                                icon: const Icon(Icons.camera_alt_rounded)),
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 18),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[500],
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(10),
                            child: IconButton(
                                iconSize: 30,
                                onPressed: () {},
                                icon: const Icon(Icons.photo_album_rounded)),
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 18),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Center(
                      child: Text("Close"),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create a Group",
        ),
        leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: const Icon(
              Icons.close,
            )),
        actions: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                "Save",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ))
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[700],
      ),
      body: Column(
        children: [
          Container(
            height: 1,
            color: Colors.grey[400],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            showSheet();
                          },
                          icon: const Icon(
                            Icons.add_a_photo_outlined,
                            size: 25,
                          )),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    cursorHeight: 23,
                    cursorColor: Colors.grey[800],
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        filled: true,
                        fillColor: Colors.grey[200],
                        labelText: "Group Name",
                        labelStyle: TextStyle(color: Colors.grey[700]),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Type",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              height: 40,
              child: ListView.builder(
                  itemCount: grouptype.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return GroupTypeItem(
                      icon: grouptype[index].icon,
                      type: grouptype[index].type,
                      onTap: () {
                        print("Type Selected");
                      },
                    );
                  })),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Group Members",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Icon(
                  Icons.person_add,
                  color: Colors.grey[700],
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    "You will be able to add your friends after you save this new group.",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
