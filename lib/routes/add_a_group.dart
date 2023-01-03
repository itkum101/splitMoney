import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';

import 'package:splitmoney/Widgets/group_type_item.dart';
import 'package:splitmoney/Widgets/text_field.dart';
import 'package:splitmoney/utils/data.dart';

class AddGroup extends StatefulWidget {
  AddGroup({super.key});

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  //LISTEN TO GROPU LIST

  final _controller = TextEditingController();
  late String groupName = _controller.text;
  File? _image;
  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      } else {
        // final imageTemporary = File(image.path);
        final finalImage = await saveFilePermanently(image.path);
        setState(() {
          this._image = finalImage;
        });
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = Path.basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

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
            height: 101,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          getImage(ImageSource.camera);
                        },
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[500],
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(10),
                            child: Image.asset("lib/assets/camera.png")),
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(color: Colors.grey[700], fontSize: 18),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          getImage(ImageSource.gallery);
                        },
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[500],
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(10),
                            child: Image.asset("lib/assets/picture.png")),
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(color: Colors.grey[700], fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    var myList = context.watch<GroupNameProvider>().groupList;

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
              onTap: () {
                context.read<GroupNameProvider>().addToGroupList(
                      GroupList(
                          groupName: _controller.text,
                          imgPath: "lib/assets/tea.png"),
                    );
                Navigator.pop(context);
              },
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
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                    child: _image != null
                        ? Padding(
                            padding: const EdgeInsets.all(1),
                            child: Image.file(
                              _image!,
                              width: 48,
                            ),
                          )
                        : GestureDetector(
                            onTap: showSheet,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                "lib/assets/add_image.png",
                                width: 35,
                              ),
                            ))),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextBoxSample(
                  isautoFocus: false,
                  isFilled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: "Group Name",
                  cursorColor: Colors.grey[400],
                  cursorHeight: 20,
                  controller: _controller,
                ))
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
